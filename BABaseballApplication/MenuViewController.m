//
//  MenuViewController.m
//  BABaseballApplication
//
//  Created by Mac on 10/3/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "MenuViewController.h"

#import "TeamViewController.h"

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

/**
 *  Method - tableView:numberOfRowsInSection:
 */
- (NSInteger)       tableView:(UITableView *)tableView
        numberOfRowsInSection:(NSInteger)section
{
	return menuItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 100.0;
}

/**
 *  Method - tableView:cellForRowAtIndexPath:
 */
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *reuseIdentifier;
	UITableViewCell *cell;
	
	reuseIdentifier = menuItems[indexPath.row];
	cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	cell.textLabel.text = menuItems[indexPath.row];
	cell.backgroundColor = [UIColor clearColor];

	return cell;
}

@end
