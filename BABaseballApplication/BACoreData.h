//
//  BACoreData.h
//  BABaseballApplication
//
//  Created by Mac on 9/29/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "BAScoreboard.h"

@interface BACoreData : NSObject

- (void)insScoreboard:(BAScoreboard *)scoreboard;
- (NSManagedObject *)setScoreboardEntity:(NSManagedObject *)entity andObject:(BAScoreboard *)scoreboard;
- (BAScoreboard *)setScoreboardObject:(NSManagedObject *)requestResult;
- (BAScoreboard *)getScoreboardWithDate:(NSString *)date   andTime:(NSString *)time
                            andHomeTeam:(NSString *)team andRemove:(BOOL)remove;
- (NSMutableArray *)getScoreboardWithDate:(NSString *)date;
- (NSMutableArray *)getScoreboardWithDate:(NSString *)date andTeam:(NSString *)team;
- (NSMutableArray *)getScoreboardWithTeam:(NSString *)team;

@end
