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


-(NSDictionary*)parseJSON:(NSString*)year andMonth:(NSString*)month andDay:(NSString*)day{
    NSDictionary *jsonDictionary = [[NSDictionary alloc] init];
    NSURL        *url;
    NSString     *urlString      = @"http://gd2.mlb.com/components/game/mlb/year_";
    urlString = [urlString stringByAppendingString:year];
    urlString = [urlString stringByAppendingString:@"/month_"];
    urlString = [urlString stringByAppendingString:month];
    urlString = [urlString stringByAppendingString:@"/day_"];
    urlString = [urlString stringByAppendingString:day];
    urlString = [urlString stringByAppendingString:@"/master_scoreboard.json"];
    url       = [NSURL URLWithString:urlString];
    
    dispatch_async(mainQueue, ^{
        NSData *data   = [NSData dataWithContentsOfURL:url];
        [self performSelectorOnMainThread:@selector(jsonData:) withObject:data waitUntilDone:YES];
    });
    
    return jsonDictionary;
}

- (void)jsonData:(NSData *)data {
    NSError *error;
    
    // Get all the data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    // Get first part of the data
    NSDictionary *dataDictionary  = [jsonDictionary  objectForKey:@"data"];
    NSDictionary *gamesDictionary = [dataDictionary  objectForKey:@"games"];
    NSArray      *gameArray       = [gamesDictionary objectForKey:@"game"];
    
    // Extract the data
    for (NSDictionary *gameDictionary in gameArray) {
        NSString *location = [gameDictionary objectForKey:@"location"];
    }
}

@end
