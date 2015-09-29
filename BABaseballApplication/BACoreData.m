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
    
    if (test.gameDate == nil) {
        [entity setValue:scoreboard.gameDate                              forKey:@"gameDate"];
        [entity setValue:scoreboard.location                              forKey:@"location"];
        [entity setValue:scoreboard.time                                  forKey:@"time"];
        [entity setValue:scoreboard.amPM                                  forKey:@"amPM"];
        [entity setValue:scoreboard.venue                                 forKey:@"venue"];
        [entity setValue:scoreboard.awayTeamName                          forKey:@"awayTeamName"];
        [entity setValue:scoreboard.awayTeamCity                          forKey:@"awayTeamCity"];
        [entity setValue:scoreboard.awayTeamAbbr                          forKey:@"awayTeamAbbr"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayWin]  forKey:@"awayWin"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayLoss] forKey:@"awayLoss"];
        [entity setValue:[NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%@",scoreboard.awayGameBack]] forKey:@"awayGameBack"];
        [entity setValue:[NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%@",scoreboard.awayGameBackWC]] forKey:@"awayGameBackWC"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayRun]       forKey:@"awayRun"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayHit]       forKey:@"awayHit"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayError]     forKey:@"awayError"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayHomeRun]   forKey:@"awayHomeRun"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayStrikeOut] forKey:@"awayStrikeOut"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayStoleBase] forKey:@"awayStoleBase"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayInni01]    forKey:@"awayInni01"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayInni02]    forKey:@"awayInni02"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayInni03]    forKey:@"awayInni03"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayInni04]    forKey:@"awayInni04"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayInni05]    forKey:@"awayInni05"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayInni06]    forKey:@"awayInni06"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayInni07]    forKey:@"awayInni07"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayInni08]    forKey:@"awayInni08"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayInni09]    forKey:@"awayInni09"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.awayInniEx]    forKey:@"awayInniEx"];
        [entity setValue:scoreboard.homeTeamName                               forKey:@"homeTeamName"];
        [entity setValue:scoreboard.homeTeamCity                               forKey:@"homeTeamCity"];
        [entity setValue:scoreboard.homeTeamAbbr                               forKey:@"homeTeamAbbr"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeWin]       forKey:@"homeWin"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeLoss]      forKey:@"homeLoss"];
        [entity setValue:[NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%@",scoreboard.homeGameBack]] forKey:@"homeGameBack"];
        [entity setValue:[NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%@",scoreboard.homeGameBackWC]] forKey:@"homeGameBackWC"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeRun]       forKey:@"homeRun"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeHit]       forKey:@"homeHit"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeError]     forKey:@"homeError"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeHomeRun]   forKey:@"homeHomeRun"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeStrikeOut] forKey:@"homeStrikeOut"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeStoleBase] forKey:@"homeStoleBase"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeInni01]    forKey:@"homeInni01"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeInni02]    forKey:@"homeInni02"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeInni03]    forKey:@"homeInni03"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeInni04]    forKey:@"homeInni04"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeInni05]    forKey:@"homeInni05"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeInni06]    forKey:@"homeInni06"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeInni07]    forKey:@"homeInni07"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeInni08]    forKey:@"homeInni08"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeInni09]    forKey:@"homeInni09"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.homeInniEx]    forKey:@"homeInniEx"];
        [entity setValue:scoreboard.savePitchLastName  forKey:@"savePitchLastName"];
        [entity setValue:scoreboard.savePitchFirstName forKey:@"savePitchFirstName"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.savePitchNumber] forKey:@"savePitchNumber"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.savePitchWin]    forKey:@"savePitchWin"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.savePitchSave]   forKey:@"savePitchSave"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.savePitchLoss]   forKey:@"savePitchLoss"];
        [entity setValue:[NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%@",scoreboard.savePitchERA]]  forKey:@"savePitchERA"];
        [entity setValue:scoreboard.winnPitchLastName  forKey:@"winnPitchLastName"];
        [entity setValue:scoreboard.winnPitchFirstName forKey:@"winnPitchFirstName"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.winnPitchNumber] forKey:@"winnPitchNumber"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.winnPitchWin]    forKey:@"winnPitchWin"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.winnPitchSave]   forKey:@"winnPitchSave"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.winnPitchLoss]   forKey:@"winnPitchLoss"];
        [entity setValue:[NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%@",scoreboard.winnPitchERA]]  forKey:@"winnPitchERA"];
        [entity setValue:scoreboard.losePitchLastName  forKey:@"losePitchLastName"];
        [entity setValue:scoreboard.losePitchFirstName forKey:@"losePitchFirstName"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.losePitchNumber] forKey:@"losePitchNumber"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.losePitchWin]    forKey:@"losePitchWin"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.losePitchSave]   forKey:@"losePitchSave"];
        [entity setValue:[NSNumber numberWithInteger:scoreboard.losePitchLoss]   forKey:@"losePitchLoss"];
        [entity setValue:[NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%@",scoreboard.losePitchERA]]  forKey:@"losePitchERA"];
        
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

- (BAScoreboard *)setScoreboard:(NSManagedObject *)requestResult {
    BAScoreboard *scoreboard = [[BAScoreboard alloc] init];
    
    return scoreboard;
}

@end
