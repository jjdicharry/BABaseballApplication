//
//  BALocationTableViewCell.h
//  BABaseballApplication
//
//  Created by Mac on 10/5/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BALocationTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *teamLogo;
@property (weak, nonatomic) IBOutlet UILabel *stadiumLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) NSString *teamAbbr;
@property (weak, nonatomic) NSString *stadium;
@property (weak, nonatomic) NSString *street;
@property (weak, nonatomic) NSString *city;
@property (weak, nonatomic) NSString *state;
@property (weak, nonatomic) NSString *ZIPCode;
@property (weak, nonatomic) NSString *phone;

@end
