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
    AppDelegate            *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context     = [appDelegate managedObjectContext];
    NSManagedObject        *entity      = [NSEntityDescription insertNewObjectForEntityForName:@"Scoreboard"
                                                                        inManagedObjectContext:context];
    NSError                *error;
    
    [self getScoreboardWithDate:scoreboard.gameDate
                        andTime:scoreboard.time
                    andHomeTeam:scoreboard.homeTeamAbbr
                      andRemove:YES];
    
    entity = [self setScoreboardEntity:entity andObject:scoreboard];
    
    if ([context save:&error]) {
        NSLog(@"\nSaved successfully for date:%@, time:%@ and homeTeam: %@",
              scoreboard.gameDate, scoreboard.time, scoreboard.homeTeamAbbr);
    }
    else {
        NSLog(@"Saved unsuccessfully");
    }
}

- (BAScoreboard *)getScoreboardWithDate:(NSString *)date   andTime:(NSString *)time
                            andHomeTeam:(NSString *)team andRemove:(BOOL)remove {
    BAScoreboard           *scoreboard    = [[BAScoreboard alloc] init];
    AppDelegate            *appDelegate   = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context       = [appDelegate managedObjectContext];
    NSEntityDescription    *entity        = [NSEntityDescription entityForName:@"Scoreboard"
                                                        inManagedObjectContext:context];
    NSFetchRequest         *request       = [[NSFetchRequest alloc] init];
    NSPredicate            *predicate     = [[NSPredicate alloc] init];
    NSManagedObject        *requestResult;
    NSArray                *requestArray  = [[NSArray alloc] init];
    NSError                *error;
    
    predicate = [NSPredicate predicateWithFormat:@"(gameDate = %@) and (time = %@) and (homeTeamAbbr = %@)", date, time, team];
    
    [request setEntity:entity];
    [request setPredicate:predicate];
    
    requestArray = [context executeFetchRequest:request error:&error];
    
    if (requestArray.count > 0) {
        requestResult = [requestArray objectAtIndex:0];
        
        if (remove) {
            [context deleteObject:requestResult];
        }
        else {
            scoreboard = [self setScoreboardObject:requestResult];
        }
    }
    
    return scoreboard;
}

- (NSMutableArray *)getScoreboardWithDate:(NSString *)date {
    BAScoreboard           *scoreboard    = [[BAScoreboard alloc] init];
    AppDelegate            *appDelegate   = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context       = [appDelegate managedObjectContext];
    NSEntityDescription    *entity        = [NSEntityDescription entityForName:@"Scoreboard"
                                                        inManagedObjectContext:context];
    NSFetchRequest         *request       = [[NSFetchRequest alloc] init];
    NSPredicate            *predicate     = [[NSPredicate alloc] init];
    NSManagedObject        *requestResult;
    NSArray                *requestArray  = [[NSArray alloc] init];
    NSMutableArray         *returnArray   = [[NSMutableArray alloc] init];
    NSError                *error;
    
    predicate = [NSPredicate predicateWithFormat:@"(gameDate = %@)", date];
    
    [request setEntity:entity];
    [request setPredicate:predicate];
    
    requestArray = [context executeFetchRequest:request error:&error];
    
    if (requestArray.count > 0) {
        for (requestResult in requestArray) {
            scoreboard = [self setScoreboardObject:requestResult];
            
            [returnArray addObject:scoreboard];
        }
    }
    
    return returnArray;
}

- (NSManagedObject *)setScoreboardEntity:(NSManagedObject *)entity andObject:(BAScoreboard *)scoreboard {
    [entity setValue:scoreboard.gameDate           forKey:@"gameDate"];
    [entity setValue:scoreboard.location           forKey:@"location"];
    [entity setValue:scoreboard.time               forKey:@"time"];
    [entity setValue:scoreboard.amPM               forKey:@"amPM"];
    [entity setValue:scoreboard.venue              forKey:@"venue"];
    [entity setValue:scoreboard.awayTeamName       forKey:@"awayTeamName"];
    [entity setValue:scoreboard.awayTeamCity       forKey:@"awayTeamCity"];
    [entity setValue:scoreboard.awayTeamAbbr       forKey:@"awayTeamAbbr"];
    [entity setValue:scoreboard.awayWin            forKey:@"awayWin"];
    [entity setValue:scoreboard.awayLoss           forKey:@"awayLoss"];
    [entity setValue:scoreboard.awayGameBack       forKey:@"awayGameBack"];
    [entity setValue:scoreboard.awayGameBackWC     forKey:@"awayGameBackWC"];
    [entity setValue:scoreboard.awayRun            forKey:@"awayRun"];
    [entity setValue:scoreboard.awayHit            forKey:@"awayHit"];
    [entity setValue:scoreboard.awayError          forKey:@"awayError"];
    [entity setValue:scoreboard.awayHomeRun        forKey:@"awayHomeRun"];
    [entity setValue:scoreboard.awayStrikeOut      forKey:@"awayStrikeOut"];
    [entity setValue:scoreboard.awayStoleBase      forKey:@"awayStoleBase"];
    [entity setValue:scoreboard.awayInni01         forKey:@"awayInni01"];
    [entity setValue:scoreboard.awayInni02         forKey:@"awayInni02"];
    [entity setValue:scoreboard.awayInni03         forKey:@"awayInni03"];
    [entity setValue:scoreboard.awayInni04         forKey:@"awayInni04"];
    [entity setValue:scoreboard.awayInni05         forKey:@"awayInni05"];
    [entity setValue:scoreboard.awayInni06         forKey:@"awayInni06"];
    [entity setValue:scoreboard.awayInni07         forKey:@"awayInni07"];
    [entity setValue:scoreboard.awayInni08         forKey:@"awayInni08"];
    [entity setValue:scoreboard.awayInni09         forKey:@"awayInni09"];
    [entity setValue:scoreboard.awayInniEx         forKey:@"awayInniEx"];
    [entity setValue:scoreboard.homeTeamName       forKey:@"homeTeamName"];
    [entity setValue:scoreboard.homeTeamCity       forKey:@"homeTeamCity"];
    [entity setValue:scoreboard.homeTeamAbbr       forKey:@"homeTeamAbbr"];
    [entity setValue:scoreboard.homeWin            forKey:@"homeWin"];
    [entity setValue:scoreboard.homeLoss           forKey:@"homeLoss"];
    [entity setValue:scoreboard.homeGameBack       forKey:@"homeGameBack"];
    [entity setValue:scoreboard.homeGameBackWC     forKey:@"homeGameBackWC"];
    [entity setValue:scoreboard.homeRun            forKey:@"homeRun"];
    [entity setValue:scoreboard.homeHit            forKey:@"homeHit"];
    [entity setValue:scoreboard.homeError          forKey:@"homeError"];
    [entity setValue:scoreboard.homeHomeRun        forKey:@"homeHomeRun"];
    [entity setValue:scoreboard.homeStrikeOut      forKey:@"homeStrikeOut"];
    [entity setValue:scoreboard.homeStoleBase      forKey:@"homeStoleBase"];
    [entity setValue:scoreboard.homeInni01         forKey:@"homeInni01"];
    [entity setValue:scoreboard.homeInni02         forKey:@"homeInni02"];
    [entity setValue:scoreboard.homeInni03         forKey:@"homeInni03"];
    [entity setValue:scoreboard.homeInni04         forKey:@"homeInni04"];
    [entity setValue:scoreboard.homeInni05         forKey:@"homeInni05"];
    [entity setValue:scoreboard.homeInni06         forKey:@"homeInni06"];
    [entity setValue:scoreboard.homeInni07         forKey:@"homeInni07"];
    [entity setValue:scoreboard.homeInni08         forKey:@"homeInni08"];
    [entity setValue:scoreboard.homeInni09         forKey:@"homeInni09"];
    [entity setValue:scoreboard.homeInniEx         forKey:@"homeInniEx"];
    [entity setValue:scoreboard.savePitchLastName  forKey:@"savePitchLastName"];
    [entity setValue:scoreboard.savePitchFirstName forKey:@"savePitchFirstName"];
    [entity setValue:scoreboard.savePitchNumber    forKey:@"savePitchNumber"];
    [entity setValue:scoreboard.savePitchWin       forKey:@"savePitchWin"];
    [entity setValue:scoreboard.savePitchSave      forKey:@"savePitchSave"];
    [entity setValue:scoreboard.savePitchLoss      forKey:@"savePitchLoss"];
    [entity setValue:scoreboard.savePitchERA       forKey:@"savePitchERA"];
    [entity setValue:scoreboard.winnPitchLastName  forKey:@"winnPitchLastName"];
    [entity setValue:scoreboard.winnPitchFirstName forKey:@"winnPitchFirstName"];
    [entity setValue:scoreboard.winnPitchNumber    forKey:@"winnPitchNumber"];
    [entity setValue:scoreboard.winnPitchWin       forKey:@"winnPitchWin"];
    [entity setValue:scoreboard.winnPitchSave      forKey:@"winnPitchSave"];
    [entity setValue:scoreboard.winnPitchLoss      forKey:@"winnPitchLoss"];
    [entity setValue:scoreboard.winnPitchERA       forKey:@"winnPitchERA"];
    [entity setValue:scoreboard.losePitchLastName  forKey:@"losePitchLastName"];
    [entity setValue:scoreboard.losePitchFirstName forKey:@"losePitchFirstName"];
    [entity setValue:scoreboard.losePitchNumber    forKey:@"losePitchNumber"];
    [entity setValue:scoreboard.losePitchWin       forKey:@"losePitchWin"];
    [entity setValue:scoreboard.losePitchSave      forKey:@"losePitchSave"];
    [entity setValue:scoreboard.losePitchLoss      forKey:@"losePitchLoss"];
    [entity setValue:scoreboard.losePitchERA       forKey:@"losePitchERA"];
    
    return entity;
}

- (BAScoreboard *)setScoreboardObject:(NSManagedObject *)requestResult {
    BAScoreboard *scoreboard = [[BAScoreboard alloc] init];
    
    scoreboard.gameDate           = [requestResult valueForKey:@"gameDate"];
    scoreboard.location           = [requestResult valueForKey:@"location"];
    scoreboard.time               = [requestResult valueForKey:@"time"];
    scoreboard.amPM               = [requestResult valueForKey:@"amPM"];
    scoreboard.venue              = [requestResult valueForKey:@"venue"];
    scoreboard.awayTeamName       = [requestResult valueForKey:@"awayTeamName"];
    scoreboard.awayTeamCity       = [requestResult valueForKey:@"awayTeamCity"];
    scoreboard.awayTeamAbbr       = [requestResult valueForKey:@"awayTeamAbbr"];
    scoreboard.awayWin            = [requestResult valueForKey:@"awayWin"];
    scoreboard.awayLoss           = [requestResult valueForKey:@"awayLoss"];
    scoreboard.awayGameBack       = [requestResult valueForKey:@"awayGameBack"];
    scoreboard.awayGameBackWC     = [requestResult valueForKey:@"awayGameBackWC"];
    scoreboard.awayRun            = [requestResult valueForKey:@"awayRun"];
    scoreboard.awayHit            = [requestResult valueForKey:@"awayHit"];
    scoreboard.awayError          = [requestResult valueForKey:@"awayError"];
    scoreboard.awayHomeRun        = [requestResult valueForKey:@"awayHomeRun"];
    scoreboard.awayStrikeOut      = [requestResult valueForKey:@"awayStrikeOut"];
    scoreboard.awayStoleBase      = [requestResult valueForKey:@"awayStoleBase"];
    scoreboard.awayInni01         = [requestResult valueForKey:@"awayInni01"];
    scoreboard.awayInni02         = [requestResult valueForKey:@"awayInni02"];
    scoreboard.awayInni03         = [requestResult valueForKey:@"awayInni03"];
    scoreboard.awayInni04         = [requestResult valueForKey:@"awayInni04"];
    scoreboard.awayInni05         = [requestResult valueForKey:@"awayInni05"];
    scoreboard.awayInni06         = [requestResult valueForKey:@"awayInni06"];
    scoreboard.awayInni07         = [requestResult valueForKey:@"awayInni07"];
    scoreboard.awayInni08         = [requestResult valueForKey:@"awayInni08"];
    scoreboard.awayInni09         = [requestResult valueForKey:@"awayInni09"];
    scoreboard.awayInniEx         = [requestResult valueForKey:@"awayInniEx"];
    scoreboard.homeTeamName       = [requestResult valueForKey:@"homeTeamName"];
    scoreboard.homeTeamCity       = [requestResult valueForKey:@"homeTeamCity"];
    scoreboard.homeTeamAbbr       = [requestResult valueForKey:@"homeTeamAbbr"];
    scoreboard.homeWin            = [requestResult valueForKey:@"homeWin"];
    scoreboard.homeLoss           = [requestResult valueForKey:@"homeLoss"];
    scoreboard.homeGameBack       = [requestResult valueForKey:@"homeGameBack"];
    scoreboard.homeGameBackWC     = [requestResult valueForKey:@"homeGameBackWC"];
    scoreboard.homeRun            = [requestResult valueForKey:@"homeRun"];
    scoreboard.homeHit            = [requestResult valueForKey:@"homeHit"];
    scoreboard.homeError          = [requestResult valueForKey:@"homeError"];
    scoreboard.homeHomeRun        = [requestResult valueForKey:@"homeHomeRun"];
    scoreboard.homeStrikeOut      = [requestResult valueForKey:@"homeStrikeOut"];
    scoreboard.homeStoleBase      = [requestResult valueForKey:@"homeStoleBase"];
    scoreboard.homeInni01         = [requestResult valueForKey:@"homeInni01"];
    scoreboard.homeInni02         = [requestResult valueForKey:@"homeInni02"];
    scoreboard.homeInni03         = [requestResult valueForKey:@"homeInni03"];
    scoreboard.homeInni04         = [requestResult valueForKey:@"homeInni04"];
    scoreboard.homeInni05         = [requestResult valueForKey:@"homeInni05"];
    scoreboard.homeInni06         = [requestResult valueForKey:@"homeInni06"];
    scoreboard.homeInni07         = [requestResult valueForKey:@"homeInni07"];
    scoreboard.homeInni08         = [requestResult valueForKey:@"homeInni08"];
    scoreboard.homeInni09         = [requestResult valueForKey:@"homeInni09"];
    scoreboard.homeInniEx         = [requestResult valueForKey:@"homeInniEx"];
    scoreboard.savePitchLastName  = [requestResult valueForKey:@"savePitchLastName"];
    scoreboard.savePitchFirstName = [requestResult valueForKey:@"savePitchFirstName"];
    scoreboard.savePitchNumber    = [requestResult valueForKey:@"savePitchNumber"];
    scoreboard.savePitchWin       = [requestResult valueForKey:@"savePitchWin"];
    scoreboard.savePitchSave      = [requestResult valueForKey:@"savePitchSave"];
    scoreboard.savePitchLoss      = [requestResult valueForKey:@"savePitchLoss"];
    scoreboard.savePitchERA       = [requestResult valueForKey:@"savePitchERA"];
    scoreboard.winnPitchLastName  = [requestResult valueForKey:@"winnPitchLastName"];
    scoreboard.winnPitchFirstName = [requestResult valueForKey:@"winnPitchFirstName"];
    scoreboard.winnPitchNumber    = [requestResult valueForKey:@"winnPitchNumber"];
    scoreboard.winnPitchWin       = [requestResult valueForKey:@"winnPitchWin"];
    scoreboard.winnPitchSave      = [requestResult valueForKey:@"winnPitchSave"];
    scoreboard.winnPitchLoss      = [requestResult valueForKey:@"winnPitchLoss"];
    scoreboard.winnPitchERA       = [requestResult valueForKey:@"winnPitchERA"];
    scoreboard.losePitchLastName  = [requestResult valueForKey:@"losePitchLastName"];
    scoreboard.losePitchFirstName = [requestResult valueForKey:@"losePitchFirstName"];
    scoreboard.losePitchNumber    = [requestResult valueForKey:@"losePitchNumber"];
    scoreboard.losePitchWin       = [requestResult valueForKey:@"losePitchWin"];
    scoreboard.losePitchSave      = [requestResult valueForKey:@"losePitchSave"];
    scoreboard.losePitchLoss      = [requestResult valueForKey:@"losePitchLoss"];
    scoreboard.losePitchERA       = [requestResult valueForKey:@"losePitchERA"];
    
    return scoreboard;
}

@end
