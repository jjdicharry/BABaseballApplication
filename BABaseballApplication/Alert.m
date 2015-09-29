//
//  Alert.m
//  BABaseballApplication
//
//  Created by Mac on 9/28/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "Alert.h"

@implementation Alert

/*
 *  Display an alert view with a core data error.
 */
+ (void)showCoreDataError:(NSError *)error delegate:(id)delegate
{
    UIAlertController *alert;
    UIAlertAction *action;
    NSString *message;
    UIAlertControllerStyle style;

    message = [NSString stringWithFormat:@"Save Core Data Failed %@",
               [error localizedDescription]];

    style = UIAlertControllerStyleAlert;

    alert = [UIAlertController alertControllerWithTitle:@"Save failed"
                                                message:message
                                         preferredStyle:style];

    action = [UIAlertAction actionWithTitle:@"OK"
                                      style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {}];

    [alert addAction:action];

    [delegate presentViewController:alert animated:YES completion:nil];
}

@end
