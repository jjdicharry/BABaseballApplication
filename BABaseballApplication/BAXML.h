//
//  BAXML.h
//  BABaseballApplication
//
//  Created by Mac on 10/3/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BAScoreboard.h"

@interface BAXML : NSObject <NSXMLParserDelegate>

- (BAScoreboard *)parseXMLWithURL:(NSString *)urlString andScoreboard:(BAScoreboard *)scoreboard;

@end
