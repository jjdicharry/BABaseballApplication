//
//  Team.h
//  BABaseballApplication
//
//  Created by Mac on 9/28/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Team : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign) BOOL favorite;

- (Team *)initWithName:(NSString *)name;

@end
