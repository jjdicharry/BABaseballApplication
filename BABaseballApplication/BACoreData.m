//
//  BACoreData.m
//  BABaseballApplication
//
//  Created by Mac on 9/29/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "BACoreData.h"

@implementation BACoreData

- (void)insScoreboard:(BAScoreboard *)scoreboard {
    BAScoreboard           *test        = [[BAScoreboard alloc] init];
    AppDelegate            *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context     = [appDelegate managedObjectContext];
    NSManagedObject        *entity      = [NSEntityDescription insertNewObjectForEntityForName:@"Scoreboard"
                                                                        inManagedObjectContext:context];
    
    test = [self getScoreboardWithDate:scoreboard.gameDate
                               andTime:scoreboard.time
                           andHomeTeam:scoreboard.homeTeamAbbr];
    
    if ([test.gameDate isEqualToString:@""]) {
        [entity setValue:scoreboard.gameDate     forKey:@"gameDate"];
        [entity setValue:scoreboard.location     forKey:@"location"];
        [entity setValue:scoreboard.time         forKey:@"time"];
        [entity setValue:scoreboard.amPM         forKey:@"amPM"];
        [entity setValue:scoreboard.venue        forKey:@"venue"];
        [entity setValue:scoreboard.awayTeamName forKey:@"awayTeamName"];
        [entity setValue:scoreboard.awayTeamCity forKey:@"awayTeamCity"];
        [entity setValue:scoreboard.awayTeamAbbr forKey:@"awayTeamAbbr"];
        
        NSError *error;
        
        if ([context save:&error]) {
            NSLog(@"Saved successfully");
        }
        else {
            NSLog(@"Saved unsuccessfully");
        }
    }
}

- (BAScoreboard*)getScoreboardWithDate:(NSString*)date andTime:(NSString*)time andHomeTeam:(NSString*)team {
    BAScoreboard           *scoreboard  = [[BAScoreboard alloc] init];
    AppDelegate            *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context     = [appDelegate managedObjectContext];
    NSEntityDescription    *entity      = [NSEntityDescription entityForName:@"Scoreboard"
                                                      inManagedObjectContext:context];
    
    NSFetchRequest *request   = [[NSFetchRequest alloc] init];
    NSError        *error;
    NSPredicate    *predicate = [NSPredicate predicateWithFormat:@"(gameDate = %@) and (time = %@) and (homeTeamAbbr = %@)", date, time, team];
    
    [request setEntity:entity];
    [request setPredicate:predicate];
    
    NSManagedObject *requestResult = nil;
    NSArray         *requestArray  = [context executeFetchRequest:request error:&error];
    
    if (requestArray.count == 0) {
        scoreboard = [[BAScoreboard alloc] init];
    }
    else {
        requestResult       = [requestArray objectAtIndex:0];
        scoreboard.gameDate = [requestResult valueForKey:@"gameDate"];
    }
    
    return scoreboard;
}

@end
