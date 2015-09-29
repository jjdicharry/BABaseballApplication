//
//  TeamTableViewCell.h
//  BABaseballApplication
//
//  Created by Mac on 9/28/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriteIcon;

- (IBAction)favoritePressed:(id)sender;

@end
