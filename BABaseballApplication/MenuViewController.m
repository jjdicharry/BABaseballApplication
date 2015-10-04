//
//  MenuViewController.m
//  BABaseballApplication
//
//  Created by Mac on 10/3/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "MenuViewController.h"

#import "MenuTableViewCell.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
{
	NSArray *menuItems;
}

/**
 *  Method - viewDidLoad
 */
- (void)viewDidLoad
{
	[super viewDidLoad];
	
	menuItems = @[@"Favorites", @"All Teams", @"Locations"];
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

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
	 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *reuseIdentifier = @"MenuTableViewCell";
	MenuTableViewCell *cell;
	
	cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	cell.itemLabel.text = menuItems[indexPath.row];
	
	return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
// preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.
}

@end
