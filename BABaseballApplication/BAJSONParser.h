//
//  BAJSONParser.h
//  BABaseballApplication
//
//  Created by Mac on 9/26/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAJSONParser : NSObject

- (NSDictionary *)parseJSONWithYear:(NSString *)year andMonth:(NSString *)month andDay:(NSString *)day;
- (NSData *)getScoreboardWithDate:(NSString *)date andTime:(NSString *)time andHomeTeam:(NSString *)team;

@end
