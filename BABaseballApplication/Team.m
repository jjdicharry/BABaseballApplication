//
//  Team.m
//  BABaseballApplication
//
//  Created by Mac on 9/28/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "Team.h"

@implementation Team

- (Team *)initWithName:(NSString *)name
{
	self = [super init];
	
	self.name = name;
	self.favorite = NO;
	return self;
}

@end
