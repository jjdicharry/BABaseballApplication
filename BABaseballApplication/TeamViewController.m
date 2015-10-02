//
//  ViewController.m
//  BABaseballApplication
//
//  Created by Mac on 9/26/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "TeamViewController.h"

#import "BAJSON.h"
#import "Favorite.h"
#import "TeamTableViewCell.h"
#import "GamesViewController.h"

@interface TeamViewController ()

@end

@implementation TeamViewController
{
    NSArray *teams;
    NSArray *unsortedTeams;
}

/**
 *  Method - viewDidLoad
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BAJSON *json = [[BAJSON alloc] init];
    
    for (int i=1; i<=1; i++) {
        [json parseScoreboardWithYear:@"2015"
                             andMonth:@"10"
                               andDay:[NSString stringWithFormat:@"%02i",i]];
    }
    
    // load teams from Defaults.plist
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path;
    NSMutableDictionary *root;
    path = [bundle pathForResource:@"Defaults" ofType:@"plist"];
    root = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    unsortedTeams = [root objectForKey:@"Teams"];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    teams = [unsortedTeams sortedArrayUsingDescriptors:sortDescriptors];
}

/**
 *  Method - didReceiveMemoryWarning
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return 1;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
	tableView.sectionIndexColor = [UIColor redColor];
     return @"Section Title";
}

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    /*
       NSArray *favorites;
       NSError *error;

       favorites = [Favorite getAll:&error];

       if (!error && (favorites.count > 0)) {
            if (section == 2)
                    return teams.count;
            else if (section == 1)
                    return 0;
       }
     */

    return teams.count;
}

/**
 *  Method - tableView:cellForRowAtIndexPath:
 */
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"TeamTableViewCell";
    TeamTableViewCell *cell;
    NSDictionary *team;
    NSManagedObject *favorite;
    NSMutableString *name;
    NSString *teamAbbr;
    NSError *error;
    UIImage *icon;

    cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];

    team = [teams objectAtIndex:indexPath.row];

    name = [team objectForKey:@"Name"];
    teamAbbr = [team objectForKey:@"Abbreviation"];
    
    cell.teamLogo.image     = [UIImage imageNamed:teamAbbr];
    cell.teamNameLabel.text = name;
    cell.teamAbbr           = teamAbbr;
    cell.tableView          = tableView;
    cell.delegate           = self;

    favorite = [Favorite getByName:name error:&error];

    if (!error && favorite) {
        icon = [UIImage imageNamed:@"yellow_star"];
        [cell.favoriteIcon setImage:icon forState:UIControlStateNormal];
    } else {
        icon = [UIImage imageNamed:@"star"];
        [cell.favoriteIcon setImage:icon forState:UIControlStateNormal];
    }

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"GameSegue"]) {
        TeamTableViewCell *cell = (TeamTableViewCell *) sender;
        GamesViewController *gamesViewController;
        gamesViewController = segue.destinationViewController;
        gamesViewController.teamAbbr = cell.teamAbbr;
    }
}

@end
