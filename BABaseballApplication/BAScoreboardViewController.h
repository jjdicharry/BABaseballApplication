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

@end
