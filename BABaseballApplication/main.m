//
//  main.m
//  BABaseballApplication
//
//  Created by Mac on 9/26/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        NSString *appDelegate;
        appDelegate = NSStringFromClass([AppDelegate class]);
        return UIApplicationMain(argc, argv, nil, appDelegate);
    }
}
