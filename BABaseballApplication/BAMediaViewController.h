//
//  BAMediaViewController.h
//  BABaseballApplication
//
//  Created by Mac on 10/5/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BAMediaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) NSString *mediaURLString;

@end
