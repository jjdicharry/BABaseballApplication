//
//  Alert.h
//  BABaseballApplication
//
//  Created by Mac on 9/28/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Alert : NSObject

/**
 *  Display an alert view with a core data error.
 */
+ (void)showCoreDataError:(NSError *)error delegate:(id)delegate;

@end
