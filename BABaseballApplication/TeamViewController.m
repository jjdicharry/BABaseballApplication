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
#import "FavoriteTableViewCell.h"

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

/*
    BAJSON *json = [[BAJSON alloc] init];
    
    for (int i=1; i<=31; i++) {
        [json parseScoreboardWithYear:@"2015"
                             andMonth:@"07"
                               andDay:[NSString stringWithFormat:@"%02i",i]];
    }
*/
    
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

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
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

    cell.backgroundColor = [UIColor clearColor];

    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"TeamGameSegue"]) {
	    
        TeamTableViewCell *cell = (TeamTableViewCell *) sender;
        GamesViewController *gamesViewController;
        gamesViewController = segue.destinationViewController;
        gamesViewController.teamAbbr = cell.teamAbbr;
	    
    } else if ([segue.identifier isEqualToString:@"FavoriteTeamGameSegue"]) {
	    
        FavoriteTableViewCell *cell = (FavoriteTableViewCell *) sender;
        GamesViewController *gamesViewController;
        gamesViewController = segue.destinationViewController;
        gamesViewController.teamAbbr = cell.teamAbbr;
	    
    }
}

@end
