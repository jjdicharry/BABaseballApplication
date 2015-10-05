//
//  BAScoreboardViewController.h
//  BABaseballApplication
//
//  Created by Mac on 10/4/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BAScoreboardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *gameDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *awayLogoImage;
@property (weak, nonatomic) IBOutlet UILabel *awayBigRunLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeBigRunLabel;
@property (weak, nonatomic) IBOutlet UIImageView *homeLogoImage;
@property (weak, nonatomic) IBOutlet UILabel *awayAbbr1Label;
@property (weak, nonatomic) IBOutlet UILabel *homeAbbr1Label;
@property (weak, nonatomic) IBOutlet UILabel *homeAbbr2Label;
@property (weak, nonatomic) IBOutlet UILabel *awayAbbr2Label;
@property (weak, nonatomic) IBOutlet UILabel *awayRunLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeRunLabel;
@property (weak, nonatomic) IBOutlet UILabel *awayHitLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeHitLabel;
@property (weak, nonatomic) IBOutlet UILabel *awayErrorLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeErrorLabel;
@property (weak, nonatomic) IBOutlet UILabel *awayHomeRunLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeHomeRunLabel;
@property (weak, nonatomic) IBOutlet UILabel *awayStrikeOutLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeStrikeOutLabel;
@property (weak, nonatomic) IBOutlet UILabel *awayStoleBaseLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeStoleBaseLabel;
@property (weak, nonatomic) IBOutlet UILabel *awayRecordLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeRecordLabel;
@property (weak, nonatomic) IBOutlet UILabel *awayRun1Label;
@property (weak, nonatomic) IBOutlet UILabel *homeRun1Label;
@property (weak, nonatomic) IBOutlet UILabel *awayRun2Label;
@property (weak, nonatomic) IBOutlet UILabel *homeRun2Label;
@property (weak, nonatomic) IBOutlet UILabel *awayRun3Label;
@property (weak, nonatomic) IBOutlet UILabel *homeRun3Label;
@property (weak, nonatomic) IBOutlet UILabel *awayRun4Label;
@property (weak, nonatomic) IBOutlet UILabel *homeRun4Label;
@property (weak, nonatomic) IBOutlet UILabel *awayRun5Label;
@property (weak, nonatomic) IBOutlet UILabel *homeRun5Label;
@property (weak, nonatomic) IBOutlet UILabel *awayRun6Label;
@property (weak, nonatomic) IBOutlet UILabel *homeRun6Label;
@property (weak, nonatomic) IBOutlet UILabel *awayRun7Label;
@property (weak, nonatomic) IBOutlet UILabel *homeRun7Label;
@property (weak, nonatomic) IBOutlet UILabel *awayRun8Label;
@property (weak, nonatomic) IBOutlet UILabel *homeRun8Label;
@property (weak, nonatomic) IBOutlet UILabel *awayRun9Label;
@property (weak, nonatomic) IBOutlet UILabel *homeRun9Label;
@property (weak, nonatomic) IBOutlet UILabel *awayRunELabel;
@property (weak, nonatomic) IBOutlet UILabel *homeRunELabel;
@property (weak, nonatomic) IBOutlet UILabel *winnPitchNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *losePitchNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *winnPitchERALabel;
@property (weak, nonatomic) IBOutlet UILabel *losePitchERALabel;
@property (weak, nonatomic) IBOutlet UIButton *media1Button;
@property (weak, nonatomic) IBOutlet UIButton *media2Button;
@property (weak, nonatomic) IBOutlet UIButton *media3Button;
@property (weak, nonatomic) IBOutlet UIButton *media4Button;
@property (weak, nonatomic) IBOutlet UIButton *media5Button;

@property (weak, nonatomic) NSString *gameDate;
@property (weak, nonatomic) NSString *time;
@property (weak, nonatomic) NSString *homeTeamAbbr;


@end
