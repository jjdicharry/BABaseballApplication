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

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

/**
 *  Method - viewDidLoad
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    NSError *error;
    NSArray *favorites;

    favorites = [Favorite getAll:&error];

    if (error || !favorites || favorites.count == 0)
        return 1;         // handle more elegantly later.

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
    NSManagedObject *team;

    cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];

    favorites = [Favorite getAll:&error];

    if (error || !favorites || (favorites.count == 0)) {
        cell.teamLabel.text = @"No Favorite Teams";
        return cell;
    }

    team = [favorites objectAtIndex:indexPath.row];
    cell.teamLabel.text = [team valueForKey:@"Name"];

    return cell;
}

/*
   #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little
      preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
