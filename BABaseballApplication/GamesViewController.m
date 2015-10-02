//
//  GamesViewController.m
//  BABaseballApplication
//
//  Created by Mac on 10/1/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "GamesViewController.h"
#import "GameTableViewCell.h"
#import "BACoreData.h"
#import "BAScoreboard.h"

@interface GamesViewController () {
    NSMutableArray *gamesArray;
}

@end

@implementation GamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    BACoreData *coreData = [[BACoreData alloc] init];
    gamesArray = [coreData getScoreboardWithTeam:self.teamAbbr];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [gamesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"GameTableViewCell";
    
    GameTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    BAScoreboard *scoreboard = (BAScoreboard *)[gamesArray objectAtIndex:indexPath.row];
    
    tableViewCell.dateLabel.text         = scoreboard.gameDate;
    tableViewCell.timeLabel.text         = [scoreboard.time stringByAppendingString:@" "];
    tableViewCell.timeLabel.text         = [tableViewCell.timeLabel.text
                                            stringByAppendingString:scoreboard.amPM];
    tableViewCell.awayTeamNameLabel.text = scoreboard.awayTeamName;
    tableViewCell.awayTeamRunsLabel.text = scoreboard.awayRun;
    tableViewCell.homeTeamNameLabel.text = scoreboard.homeTeamName;
    tableViewCell.homeTeamRunsLabel.text = scoreboard.homeRun;
    
    return tableViewCell;
}




@end
