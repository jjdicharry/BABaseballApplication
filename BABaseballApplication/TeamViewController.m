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
    [jsonParser parseJSON:@"2015" andMonth:@"09" andDay:@"26"];
	
	teams = [[NSMutableArray alloc] init];
	[teams addObject:[[Team alloc] initWithName:@"Chargers"]];
	[teams addObject:[[Team alloc] initWithName:@"Packers"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return teams.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *reuseIdentifier = @"TeamTableViewCell";
	TeamTableViewCell *cell;
	Team * team;
	
	cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	team = [teams objectAtIndex:indexPath.row];
	
	cell.teamNameLabel.text = team.name;
	
	return cell;
}

@end
