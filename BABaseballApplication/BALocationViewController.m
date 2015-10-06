//
//  BALocationViewController.m
//  BABaseballApplication
//
//  Created by Mac on 10/5/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "BALocationViewController.h"
#import "BALocationTableViewCell.h"

@interface BALocationViewController () {
    NSArray      *unsortedTeams;
    NSArray      *teams;
    NSDictionary *team;
}

@end

@implementation BALocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 70.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [teams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"LocationTableViewCell";
    BALocationTableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    team = [teams objectAtIndex:indexPath.row];
    
    cell.teamAbbr           = [team objectForKey:@"Abbreviation"];
    cell.teamLogo.image     = [UIImage imageNamed:cell.teamAbbr];
    cell.stadiumLabel.text  = [team objectForKey:@"Stadium"];
    cell.cityLabel.text     = [team objectForKey:@"City"];
    cell.cityLabel.text     = [cell.cityLabel.text stringByAppendingString:@", "];
    cell.cityLabel.text     = [cell.cityLabel.text stringByAppendingString:[team objectForKey:@"State"]];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
