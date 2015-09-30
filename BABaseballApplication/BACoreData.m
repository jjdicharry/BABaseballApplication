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
        requestResult = [requestArray objectAtIndex:0];
        [self setScoreboard:requestResult];
    }
    
    return scoreboard;
}

- (BAScoreboard *)setScoreboard:(NSManagedObject *)requestResult {
    BAScoreboard *scoreboard = [[BAScoreboard alloc] init];
    
    scoreboard.gameDate       = [requestResult  valueForKey:@"gameDate"];
    scoreboard.location       = [requestResult  valueForKey:@"location"];
    scoreboard.time           = [requestResult  valueForKey:@"time"];
    scoreboard.amPM           = [requestResult  valueForKey:@"amPM"];
    scoreboard.venue          = [requestResult  valueForKey:@"venue"];
    scoreboard.awayTeamName   = [requestResult  valueForKey:@"awayTeamName"];
    scoreboard.awayTeamCity   = [requestResult  valueForKey:@"awayTeamCity"];
    scoreboard.awayTeamAbbr   = [requestResult  valueForKey:@"awayTeamAbbr"];
    scoreboard.awayWin        = [[requestResult valueForKey:@"awayWin"] intValue];
    scoreboard.awayLoss       = [[requestResult valueForKey:@"awayLoss"] intValue];
    scoreboard.awayGameBack   = [NSDecimalNumber decimalNumberWithString:[requestResult valueForKey:@"awayGameBack"]];
    scoreboard.awayGameBackWC = [NSDecimalNumber decimalNumberWithString:[requestResult valueForKey:@"awayGameBackWC"]];
    scoreboard.awayRun        = [[requestResult valueForKey:@"awayRun"] intValue];
    scoreboard.awayHit        = [[requestResult valueForKey:@"awayHit"] intValue];
    scoreboard.awayError      = [[requestResult valueForKey:@"awayError"] intValue];
    scoreboard.awayHomeRun    = [[requestResult valueForKey:@"awayHomeRun"] intValue];
    scoreboard.awayStrikeOut  = [[requestResult valueForKey:@"awayStrikeOut"] intValue];
    scoreboard.awayStoleBase  = [[requestResult valueForKey:@"awayStoleBase"] intValue];
    scoreboard.awayInni01     = [[requestResult valueForKey:@"awayInni01"] intValue];
    scoreboard.awayInni02     = [[requestResult valueForKey:@"awayInni02"] intValue];
    scoreboard.awayInni03     = [[requestResult valueForKey:@"awayInni03"] intValue];
    scoreboard.awayInni04     = [[requestResult valueForKey:@"awayInni04"] intValue];
    scoreboard.awayInni05     = [[requestResult valueForKey:@"awayInni05"] intValue];
    scoreboard.awayInni06     = [[requestResult valueForKey:@"awayInni06"] intValue];
    scoreboard.awayInni07     = [[requestResult valueForKey:@"awayInni07"] intValue];
    scoreboard.awayInni08     = [[requestResult valueForKey:@"awayInni08"] intValue];
    scoreboard.awayInni09     = [[requestResult valueForKey:@"awayInni09"] intValue];
    scoreboard.awayInniEx     = [[requestResult valueForKey:@"awayInniEx"] intValue];
    scoreboard.homeTeamName   = [requestResult  valueForKey:@"homeTeamName"];
    scoreboard.homeTeamCity   = [requestResult  valueForKey:@"homeTeamCity"];
    scoreboard.homeTeamAbbr   = [requestResult  valueForKey:@"homeTeamAbbr"];
    scoreboard.homeWin        = [[requestResult valueForKey:@"homeWin"] intValue];
    scoreboard.homeLoss       = [[requestResult valueForKey:@"homeLoss"] intValue];
    scoreboard.homeGameBack   = [NSDecimalNumber decimalNumberWithString:[requestResult valueForKey:@"homeGameBack"]];
    scoreboard.homeGameBackWC = [NSDecimalNumber decimalNumberWithString:[requestResult valueForKey:@"homeGameBackWC"]];
    scoreboard.homeRun        = [[requestResult valueForKey:@"homeRun"] intValue];
    scoreboard.homeHit        = [[requestResult valueForKey:@"homeHit"] intValue];
    scoreboard.homeError      = [[requestResult valueForKey:@"homeError"] intValue];
    scoreboard.homeHomeRun    = [[requestResult valueForKey:@"homeHomeRun"] intValue];
    scoreboard.homeStrikeOut  = [[requestResult valueForKey:@"homeStrikeOut"] intValue];
    scoreboard.homeStoleBase  = [[requestResult valueForKey:@"homeStoleBase"] intValue];
    scoreboard.homeInni01     = [[requestResult valueForKey:@"homeInni01"] intValue];
    scoreboard.homeInni02     = [[requestResult valueForKey:@"homeInni02"] intValue];
    scoreboard.homeInni03     = [[requestResult valueForKey:@"homeInni03"] intValue];
    scoreboard.homeInni04     = [[requestResult valueForKey:@"homeInni04"] intValue];
    scoreboard.homeInni05     = [[requestResult valueForKey:@"homeInni05"] intValue];
    scoreboard.homeInni06     = [[requestResult valueForKey:@"homeInni06"] intValue];
    scoreboard.homeInni07     = [[requestResult valueForKey:@"homeInni07"] intValue];
    scoreboard.homeInni08     = [[requestResult valueForKey:@"homeInni08"] intValue];
    scoreboard.homeInni09     = [[requestResult valueForKey:@"homeInni09"] intValue];
    scoreboard.homeInniEx     = [[requestResult valueForKey:@"homeInniEx"] intValue];
    
    scoreboard.savePitchLastName  = [requestResult valueForKey:@"savePitchLastName"];
    scoreboard.savePitchFirstName = [requestResult valueForKey:@"savePitchFirstName"];
    scoreboard.savePitchNumber    = [[requestResult valueForKey:@"savePitchNumber"] integerValue];
    scoreboard.savePitchWin       = [[requestResult valueForKey:@"savePitchWin"] integerValue];
    scoreboard.savePitchSave      = [[requestResult valueForKey:@"savePitchSave"] integerValue];
    scoreboard.savePitchLoss      = [[requestResult valueForKey:@"savePitchLoss"] integerValue];
    scoreboard.savePitchERA       = [NSDecimalNumber decimalNumberWithString:[requestResult valueForKey:@"savePitchERA"]];
    scoreboard.winnPitchLastName  = [requestResult valueForKey:@"winnPitchLastName"];
    scoreboard.winnPitchFirstName = [requestResult valueForKey:@"winnPitchFirstName"];
    scoreboard.winnPitchNumber    = [[requestResult valueForKey:@"winnPitchNumber"] integerValue];
    scoreboard.winnPitchWin       = [[requestResult valueForKey:@"winnPitchWin"] integerValue];
    scoreboard.winnPitchSave      = [[requestResult valueForKey:@"winnPitchSave"] integerValue];
    scoreboard.winnPitchLoss      = [[requestResult valueForKey:@"winnPitchLoss"] integerValue];
    scoreboard.winnPitchERA       = [NSDecimalNumber decimalNumberWithString:[requestResult valueForKey:@"winnPitchERA"]];
    scoreboard.losePitchLastName  = [requestResult valueForKey:@"losePitchLastName"];
    scoreboard.losePitchFirstName = [requestResult valueForKey:@"losePitchFirstName"];
    scoreboard.losePitchNumber    = [[requestResult valueForKey:@"losePitchNumber"] integerValue];
    scoreboard.losePitchWin       = [[requestResult valueForKey:@"losePitchWin"] integerValue];
    scoreboard.losePitchSave      = [[requestResult valueForKey:@"losePitchSave"] integerValue];
    scoreboard.losePitchLoss      = [[requestResult valueForKey:@"losePitchLoss"] integerValue];
    scoreboard.losePitchERA       = [NSDecimalNumber decimalNumberWithString:[requestResult valueForKey:@"losePitchERA"]];
    
    return scoreboard;
}

@end
