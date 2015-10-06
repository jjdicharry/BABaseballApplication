//
//  BALocationViewController.m
//  BABaseballApplication
//
//  Created by Mac on 10/5/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "BALocationViewController.h"
#import "BALocationTableViewCell.h"
#import "BAMapViewController.h"

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
    
    cell.teamAbbr          = [team objectForKey:@"Abbreviation"];
    cell.stadium           = [team objectForKey:@"Stadium"];
    cell.street            = [team objectForKey:@"Street"];
    cell.city              = [team objectForKey:@"City"];
    cell.state             = [team objectForKey:@"State"];
    cell.ZIPCode           = [team objectForKey:@"ZIP Code"];
    cell.phone             = [team objectForKey:@"Phone"];
    cell.teamLogo.image    = [UIImage imageNamed:cell.teamAbbr];
    cell.stadiumLabel.text = cell.stadium;
    cell.cityLabel.text    = cell.city;
    cell.cityLabel.text    = [cell.cityLabel.text stringByAppendingString:@", "];
    cell.cityLabel.text    = [cell.cityLabel.text stringByAppendingString:cell.state];
    cell.backgroundColor   = [UIColor clearColor];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"LocationSegue"]) {
        BALocationTableViewCell *cell = (BALocationTableViewCell *) sender;
        BAMapViewController *mapViewController;
        mapViewController          = segue.destinationViewController;
        mapViewController.teamAbbr = cell.teamAbbr;
        mapViewController.stadium  = cell.stadium;
        mapViewController.street   = cell.street;
        mapViewController.city     = cell.city;
        mapViewController.state    = cell.state;
        mapViewController.ZIPCode  = cell.ZIPCode;
        mapViewController.phone    = cell.phone;
    }
}

@end
