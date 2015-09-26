//
//  BAJSONParser.m
//  BABaseballApplication
//
//  Created by Mac on 9/26/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "BAJSONParser.h"
#define mainQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)


@implementation BAJSONParser


-(NSDictionary*)parseJSON:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day{
    NSDictionary *jsonDictionary = [[NSDictionary alloc] init];
    NSURL        *url            = [NSURL URLWithString:@"http://itunes.apple.com/us/rss/topalbums/limit=20/json"];
    
    dispatch_async(mainQueue, ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        [self performSelectorOnMainThread:@selector(jsonData:) withObject:data waitUntilDone:YES];
    });
    
    
    
    return jsonDictionary;
}

@end
