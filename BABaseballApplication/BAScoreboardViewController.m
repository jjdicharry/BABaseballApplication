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
    
    scoreboard = [coreData getScoreboardWithDate:self.gameDate
                                         andTime:self.time
                                     andHomeTeam:self.homeTeamAbbr
                                       andRemove:NO];
    
    if (scoreboard.gameDate != nil) {
        self.gameDateLabel.text   = scoreboard.gameDate;
        self.timeLabel.text       = scoreboard.time;
        self.timeLabel.text       = [self.timeLabel.text stringByAppendingString:@" "];
        self.timeLabel.text       = [self.timeLabel.text stringByAppendingString:scoreboard.amPM];
        self.awayLogoImage.image  = [UIImage imageNamed:scoreboard.awayTeamAbbr];
        self.awayBigRunLabel.text = scoreboard.awayRun;
        self.homeLogoImage.image  = [UIImage imageNamed:scoreboard.homeTeamAbbr];
        self.homeBigRunLabel.text = scoreboard.homeRun;
        self.awayRecordLabel.text = @"W: ";
        self.awayRecordLabel.text = [self.awayRecordLabel.text stringByAppendingString:scoreboard.awayWin];
        self.awayRecordLabel.text = [self.awayRecordLabel.text stringByAppendingString:@" - L: "];
        self.awayRecordLabel.text = [self.awayRecordLabel.text stringByAppendingString:scoreboard.awayLoss];
        self.homeRecordLabel.text = @"W: ";
        self.homeRecordLabel.text = [self.homeRecordLabel.text stringByAppendingString:scoreboard.homeWin];
        self.homeRecordLabel.text = [self.homeRecordLabel.text stringByAppendingString:@" - L: "];
        self.homeRecordLabel.text = [self.homeRecordLabel.text stringByAppendingString:scoreboard.homeLoss];
        
        self.awayAbbr1Label.text     = scoreboard.awayTeamAbbr;
        self.awayRunLabel.text       = scoreboard.awayRun;
        self.awayHitLabel.text       = scoreboard.awayHit;
        self.awayErrorLabel.text     = scoreboard.awayError;
        self.awayHomeRunLabel.text   = scoreboard.awayHomeRun;
        self.awayStrikeOutLabel.text = scoreboard.awayStrikeOut;
        self.awayStoleBaseLabel.text = scoreboard.awayStoleBase;
        self.homeAbbr1Label.text     = scoreboard.homeTeamAbbr;
        self.homeRunLabel.text       = scoreboard.homeRun;
        self.homeHitLabel.text       = scoreboard.homeHit;
        self.homeErrorLabel.text     = scoreboard.homeError;
        self.homeHomeRunLabel.text   = scoreboard.homeHomeRun;
        self.homeStrikeOutLabel.text = scoreboard.homeStrikeOut;
        self.homeStoleBaseLabel.text = scoreboard.homeStoleBase;
        
        self.awayAbbr2Label.text     = scoreboard.awayTeamAbbr;
        self.awayRun1Label.text      = scoreboard.awayInni01;
        self.awayRun2Label.text      = scoreboard.awayInni02;
        self.awayRun3Label.text      = scoreboard.awayInni03;
        self.awayRun4Label.text      = scoreboard.awayInni04;
        self.awayRun5Label.text      = scoreboard.awayInni05;
        self.awayRun6Label.text      = scoreboard.awayInni06;
        self.awayRun7Label.text      = scoreboard.awayInni07;
        self.awayRun8Label.text      = scoreboard.awayInni08;
        self.awayRun9Label.text      = scoreboard.awayInni09;
        self.awayRunELabel.text      = scoreboard.awayInniEx;
        self.homeAbbr2Label.text     = scoreboard.homeTeamAbbr;
        self.homeRun1Label.text      = scoreboard.homeInni01;
        self.homeRun2Label.text      = scoreboard.homeInni02;
        self.homeRun3Label.text      = scoreboard.homeInni03;
        self.homeRun4Label.text      = scoreboard.homeInni04;
        self.homeRun5Label.text      = scoreboard.homeInni05;
        self.homeRun6Label.text      = scoreboard.homeInni06;
        self.homeRun7Label.text      = scoreboard.homeInni07;
        self.homeRun8Label.text      = scoreboard.homeInni08;
        self.homeRun9Label.text      = scoreboard.homeInni09;
        self.homeRunELabel.text      = scoreboard.homeInniEx;
        self.winnPitchNameLabel.text = scoreboard.winnPitchLastName;
        self.winnPitchERALabel.text  = scoreboard.winnPitchERA;
        self.losePitchNameLabel.text = scoreboard.losePitchLastName;
        self.losePitchERALabel.text  = scoreboard.losePitchERA;
        
        if (scoreboard.highlightURL01 == nil) {
            [self.media1Button setHidden:YES];
        }
        else {
            [self.media1Button setTitle:[NSString stringWithString:scoreboard.highlightURL01]
                               forState: UIControlStateNormal];
            [self.media1Button setTitleColor:[UIColor clearColor] forState: UIControlStateNormal];
        }
        
        if (scoreboard.highlightURL02 == nil) {
            [self.media2Button setHidden:YES];
        }
        else {
            [self.media2Button setTitle:[NSString stringWithString:scoreboard.highlightURL02]
                               forState: UIControlStateNormal];
            [self.media2Button setTitleColor:[UIColor clearColor] forState: UIControlStateNormal];
        }
        
        if (scoreboard.highlightURL03 == nil) {
            [self.media3Button setHidden:YES];
        }
        else {
            [self.media3Button setTitle:[NSString stringWithString:scoreboard.highlightURL03]
                               forState: UIControlStateNormal];
            [self.media3Button setTitleColor:[UIColor clearColor] forState: UIControlStateNormal];
        }
        
        if (scoreboard.highlightURL04 == nil) {
            [self.media4Button setHidden:YES];
        }
        else {
            [self.media4Button setTitle:[NSString stringWithString:scoreboard.highlightURL04]
                               forState: UIControlStateNormal];
            [self.media4Button setTitleColor:[UIColor clearColor] forState: UIControlStateNormal];
        }
        
        
        if (scoreboard.highlightURL05 == nil) {
            [self.media5Button setHidden:YES];
        }
        else {
            [self.media5Button setTitle:[NSString stringWithString:scoreboard.highlightURL05]
                               forState: UIControlStateNormal];
            [self.media5Button setTitleColor:[UIColor clearColor] forState: UIControlStateNormal];
        }
    }
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
