//
//  GamesViewController.h
//  BABaseballApplication
//
//  Created by Mac on 10/1/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamesViewController : UIViewController
    <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) NSString *teamAbbr;

@end
