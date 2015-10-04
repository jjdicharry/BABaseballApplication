//
//  BAScoreboardViewController.m
//  BABaseballApplication
//
//  Created by Mac on 10/4/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "BAScoreboardViewController.h"
#import "BAScoreboard.h"
#import "BACoreData.h"

@interface BAScoreboardViewController ()

@end

@implementation BAScoreboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BACoreData   *coreData   = [[BACoreData alloc] init];
    BAScoreboard *scoreboard = [[BAScoreboard alloc] init];
    
    scoreboard = [coreData getScoreboardWithDate:self.gameDateLabel.text
                                         andTime:self.timeLabel.text
                                     andHomeTeam:self.homeAbbr1Label.text
                                       andRemove:NO];
    self.gameDateLabel.text = scoreboard.gameDate;
    self.timeLabel.text     = scoreboard.time;
    [self.timeLabel.text stringByAppendingString:@" "];
    [self.timeLabel.text stringByAppendingString:scoreboard.amPM];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
