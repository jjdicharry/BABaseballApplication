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
#import "BAMediaViewController.h"

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

        if (scoreboard.awayRun != nil && [scoreboard.awayRun integerValue] < 10)
            self.awayBigRunLabel.text = [[@" " stringByAppendingString:scoreboard.awayRun] stringByAppendingString:@"  "];
        else
            self.awayBigRunLabel.text = scoreboard.awayRun;
	    
            
        self.homeLogoImage.image  = [UIImage imageNamed:scoreboard.homeTeamAbbr];
	    
        if (scoreboard.homeRun != nil && [scoreboard.homeRun integerValue] < 10)
            self.homeBigRunLabel.text = [[@" " stringByAppendingString:scoreboard.homeRun] stringByAppendingString:@"  "];
        else
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
        
        self.awayAbbr2Label.text       = scoreboard.awayTeamAbbr;
        self.awayRun1Label.text        = scoreboard.awayInni01;
        self.awayRun2Label.text        = scoreboard.awayInni02;
        self.awayRun3Label.text        = scoreboard.awayInni03;
        self.awayRun4Label.text        = scoreboard.awayInni04;
        self.awayRun5Label.text        = scoreboard.awayInni05;
        self.awayRun6Label.text        = scoreboard.awayInni06;
        self.awayRun7Label.text        = scoreboard.awayInni07;
        self.awayRun8Label.text        = scoreboard.awayInni08;
	    
        if (scoreboard.awayInni09 == nil)
            self.awayRun9Label.text = @"  ";
        else
            self.awayRun9Label.text        = scoreboard.awayInni09;
	    
        if (scoreboard.awayInniEx == nil)
            self.awayRunELabel.text = @"  ";
        else
            self.awayRunELabel.text        = scoreboard.awayInniEx;
	    
        self.homeAbbr2Label.text       = scoreboard.homeTeamAbbr;
        self.homeRun1Label.text        = scoreboard.homeInni01;
        self.homeRun2Label.text        = scoreboard.homeInni02;
        self.homeRun3Label.text        = scoreboard.homeInni03;
        self.homeRun4Label.text        = scoreboard.homeInni04;
        self.homeRun5Label.text        = scoreboard.homeInni05;
        self.homeRun6Label.text        = scoreboard.homeInni06;
        self.homeRun7Label.text        = scoreboard.homeInni07;
        self.homeRun8Label.text        = scoreboard.homeInni08;
	    
        if (scoreboard.homeInni09 == nil)
            self.homeRun9Label.text = @"  ";
        else
            self.homeRun9Label.text        = scoreboard.homeInni09;
	    
        if (scoreboard.homeInniEx == nil)
            self.homeRunELabel.text = @"  ";
        else
            self.homeRunELabel.text        = scoreboard.homeInniEx;
	    
        self.winnPitchNameLabel.text   = scoreboard.winnPitchLastName;
        self.losePitchNameLabel.text   = scoreboard.losePitchLastName;
        
        if (scoreboard.winnPitchWin != nil) {
            self.winnPitchRecordLabel.text = @"(";
            self.winnPitchRecordLabel.text = [self.winnPitchRecordLabel.text
                                              stringByAppendingString:scoreboard.winnPitchWin];
            self.winnPitchRecordLabel.text = [self.winnPitchRecordLabel.text stringByAppendingString:@" - "];
            self.winnPitchRecordLabel.text = [self.winnPitchRecordLabel.text
                                              stringByAppendingString:scoreboard.winnPitchLoss];
            self.winnPitchRecordLabel.text = [self.winnPitchRecordLabel.text stringByAppendingString:@")"];
        }
        
        if (scoreboard.losePitchWin != nil) {
            self.losePitchRecordLabel.text = @"(";
            self.losePitchRecordLabel.text = [self.losePitchRecordLabel.text
                                              stringByAppendingString:scoreboard.losePitchWin];
            self.losePitchRecordLabel.text = [self.losePitchRecordLabel.text stringByAppendingString:@" - "];
            self.losePitchRecordLabel.text = [self.losePitchRecordLabel.text
                                              stringByAppendingString:scoreboard.losePitchLoss];
            self.losePitchRecordLabel.text = [self.losePitchRecordLabel.text stringByAppendingString:@")"];
        }
        
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *mediaURLString = @"";
    
    if ([segue.identifier isEqualToString:@"Media1Segue"]) {
        mediaURLString = self.media1Button.titleLabel.text;
    }
    else if ([segue.identifier isEqualToString:@"Media2Segue"]) {
        mediaURLString = self.media2Button.titleLabel.text;
    }
    else if ([segue.identifier isEqualToString:@"Media3Segue"]) {
        mediaURLString = self.media3Button.titleLabel.text;
    }
    else if ([segue.identifier isEqualToString:@"Media4Segue"]) {
        mediaURLString = self.media4Button.titleLabel.text;
    }
    else if ([segue.identifier isEqualToString:@"Media5Segue"]) {
        mediaURLString = self.media5Button.titleLabel.text;
    }
    
    BAMediaViewController *mediaViewController;
    mediaViewController                = segue.destinationViewController;
    mediaViewController.mediaURLString = mediaURLString;
}

@end
