//
//  ViewController.m
//  BABaseballApplication
//
//  Created by Mac on 9/26/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "TeamViewController.h"

#import "BAJSONParser.h"
#import "Team.h"
#import "TeamTableViewCell.h"

@interface TeamViewController ()

@end

@implementation TeamViewController
{
	NSMutableArray *teams;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BAJSONParser *jsonParser = [[BAJSONParser alloc] init];
    [jsonParser parseJSONWithYear:@"2015" andMonth:@"09" andDay:@"26"];
	
	// load teams from Defaults.plist
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *path;
	NSMutableDictionary *root;
	path = [bundle pathForResource:@"Defaults" ofType:@"plist"];
	root = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
	teams = [root objectForKey:@"Teams"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"Section Title";
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return teams.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
	 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *reuseIdentifier = @"TeamTableViewCell";
	TeamTableViewCell *cell;
	NSDictionary *team;
	
	cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	team = [teams objectAtIndex:indexPath.row];
	
	cell.teamNameLabel.text = [team objectForKey:@"Name"];
	
	return cell;
}

@end
