//
//  BACoreData.m
//  BABaseballApplication
//
//  Created by Mac on 9/29/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "BACoreData.h"

@implementation BACoreData

- (void)insScoreboardWithDate:(NSString *)date andTime:(NSString *)time andHomeTeam:(NSString *)team {
    BOOL                   rowFound       = NO;
    NSData                 *entityData    = nil;
    AppDelegate            *appDelegate   = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context       = [appDelegate managedObjectContext];
    NSEntityDescription    *contactEntity = [NSEntityDescription entityForName:@"Scoreboard"
                                                        inManagedObjectContext:context];
    
    NSFetchRequest *request   = [[NSFetchRequest alloc] init];
    NSError        *error;
    NSPredicate    *predicate = [NSPredicate predicateWithFormat:@"(gameDate = %@) and (time = %@) and (homeTeamAbbr = %@)", date, time, team];
    
    [request setEntity:contactEntity];
    [request setPredicate:predicate];
    
    NSManagedObject *matches      = nil;
    NSArray         *requestArray = [context executeFetchRequest:request error:&error];
    
    if (requestArray.count == 0) {
        entityData = nil;
        rowFound   = NO;
    }
    else {
        matches    = [requestArray objectAtIndex:0];
        entityData = [matches valueForKey:@"gameDate"];
    }
}

- (NSData *)getScoreboardWithDate:(NSString *)date andTime:(NSString *)time andHomeTeam:(NSString *)team {
    BOOL                   rowFound       = NO;
    NSData                 *entityData    = nil;
    AppDelegate            *appDelegate   = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context       = [appDelegate managedObjectContext];
    NSEntityDescription    *contactEntity = [NSEntityDescription entityForName:@"Scoreboard"
                                                        inManagedObjectContext:context];
    
    NSFetchRequest *request   = [[NSFetchRequest alloc] init];
    NSError        *error;
    NSPredicate    *predicate = [NSPredicate predicateWithFormat:@"(gameDate = %@) and (time = %@) and (homeTeamAbbr = %@)", date, time, team];
    
    [request setEntity:contactEntity];
    [request setPredicate:predicate];
    
    NSManagedObject *matches      = nil;
    NSArray         *requestArray = [context executeFetchRequest:request error:&error];
    
    if (requestArray.count == 0) {
        entityData = nil;
        rowFound   = NO;
    }
    else {
        matches    = [requestArray objectAtIndex:0];
        entityData = [matches valueForKey:@"gameDate"];
    }
    
    return entityData;
}

@end
