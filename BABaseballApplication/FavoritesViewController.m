//
//  FavoritesViewController.m
//  BABaseballApplication
//
//  Created by Mac on 9/30/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "FavoritesViewController.h"

#import "Favorite.h"
#import "FavoriteTableViewCell.h"
#import "GamesViewController.h"
#import "TeamTableViewCell.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController
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
 *  Method - viewWillAppear:
 */
- (void)viewWillAppear:(BOOL)animated
{
	[self.tableView reloadData];
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

/**
 *  Method - tableView:numberOfRowsInSection:
 */
- (NSInteger)       tableView:(UITableView *)tableView
        numberOfRowsInSection:(NSInteger)section
{
	NSError *error;
	NSArray *favorites;

	favorites = [Favorite getAll:&error];

	if (error || !favorites || favorites.count == 0)
		return 1; // handle more elegantly later.

	return favorites.count;
}

/**
 *  Method - tableView:cellForRowAtIndexPath:
 */
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

	static NSString *reuseIdentifier = @"FavoriteTableViewCell";
	FavoriteTableViewCell *cell;
	NSError *error;
	NSArray *favorites;
	NSManagedObject *favorite;
	NSString *name;
	NSString *teamAbbr;

	cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];

	cell.backgroundColor = [UIColor clearColor];
	
	favorites = [Favorite getAll:&error];

	if (error || !favorites || (favorites.count == 0)) {
		cell.teamLabel.text = @"No Favorite Teams";
		return cell;
	}

	favorite = [favorites objectAtIndex:indexPath.row];
	name = [favorite valueForKey:@"Name"];
	
	for (NSDictionary *team in teams) {
		if ([[team objectForKey:@"Name"] isEqualToString:name]) {
			teamAbbr = [team objectForKey:@"Abbreviation"];
			break;
		}
	}
	
	cell.teamLabel.text = name;
	cell.teamAbbr = teamAbbr;
	cell.teamLogo.image = [UIImage imageNamed:teamAbbr];

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
