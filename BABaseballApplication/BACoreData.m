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
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayWin]  forKey:@"awayWin"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayLoss] forKey:@"awayLoss"];
        [entity setValue:[NSString stringWithFormat:@"%@",scoreboard.awayGameBack]
                  forKey:@"awayGameBack"];
        [entity setValue:[NSString stringWithFormat:@"%@",scoreboard.awayGameBackWC]
                  forKey:@"awayGameBackWC"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayRun]   forKey:@"awayRun"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayHit]   forKey:@"awayHit"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayError] forKey:@"awayError"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayHomeRun]
                  forKey:@"awayHomeRun"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayStrikeOut]
                  forKey:@"awayStrikeOut"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayStoleBase]
                  forKey:@"awayStoleBase"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayInni01] forKey:@"awayInni01"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayInni02] forKey:@"awayInni02"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayInni03] forKey:@"awayInni03"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayInni04] forKey:@"awayInni04"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayInni05] forKey:@"awayInni05"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayInni06] forKey:@"awayInni06"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayInni07] forKey:@"awayInni07"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayInni08] forKey:@"awayInni08"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayInni09] forKey:@"awayInni09"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.awayInniEx] forKey:@"awayInniEx"];
        [entity setValue:scoreboard.homeTeamName forKey:@"homeTeamName"];
        [entity setValue:scoreboard.homeTeamCity forKey:@"homeTeamCity"];
        [entity setValue:scoreboard.homeTeamAbbr forKey:@"homeTeamAbbr"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeWin]  forKey:@"homeWin"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeLoss] forKey:@"homeLoss"];
        [entity setValue:[NSString stringWithFormat:@"%@",scoreboard.homeGameBack]
                  forKey:@"homeGameBack"];
        [entity setValue:[NSString stringWithFormat:@"%@",scoreboard.homeGameBackWC]
                  forKey:@"homeGameBackWC"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeRun]   forKey:@"homeRun"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeHit]   forKey:@"homeHit"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeError] forKey:@"homeError"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeHomeRun]
                  forKey:@"homeHomeRun"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeStrikeOut]
                  forKey:@"homeStrikeOut"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeStoleBase]
                  forKey:@"homeStoleBase"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeInni01] forKey:@"homeInni01"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeInni02] forKey:@"homeInni02"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeInni03] forKey:@"homeInni03"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeInni04] forKey:@"homeInni04"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeInni05] forKey:@"homeInni05"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeInni06] forKey:@"homeInni06"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeInni07] forKey:@"homeInni07"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeInni08] forKey:@"homeInni08"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeInni09] forKey:@"homeInni09"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.homeInniEx] forKey:@"homeInniEx"];
        [entity setValue:scoreboard.savePitchLastName  forKey:@"savePitchLastName"];
        [entity setValue:scoreboard.savePitchFirstName forKey:@"savePitchFirstName"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.savePitchNumber]
                  forKey:@"savePitchNumber"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.savePitchWin]
                  forKey:@"savePitchWin"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.savePitchSave]
                  forKey:@"savePitchSave"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.savePitchLoss]
                  forKey:@"savePitchLoss"];
        [entity setValue:[NSString stringWithFormat:@"%@",scoreboard.savePitchERA]
                  forKey:@"savePitchERA"];
        [entity setValue:scoreboard.winnPitchLastName  forKey:@"winnPitchLastName"];
        [entity setValue:scoreboard.winnPitchFirstName forKey:@"winnPitchFirstName"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.winnPitchNumber]
                  forKey:@"winnPitchNumber"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.winnPitchWin]
                  forKey:@"winnPitchWin"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.winnPitchSave]
                  forKey:@"winnPitchSave"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.winnPitchLoss]
                  forKey:@"winnPitchLoss"];
        [entity setValue:[NSString stringWithFormat:@"%@",scoreboard.winnPitchERA]
                  forKey:@"winnPitchERA"];
        [entity setValue:scoreboard.losePitchLastName  forKey:@"losePitchLastName"];
        [entity setValue:scoreboard.losePitchFirstName forKey:@"losePitchFirstName"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.losePitchNumber]
                  forKey:@"losePitchNumber"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.losePitchWin]
                  forKey:@"losePitchWin"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.losePitchSave]
                  forKey:@"losePitchSave"];
        [entity setValue:[NSString stringWithFormat:@"%i",(int)scoreboard.losePitchLoss]
                  forKey:@"losePitchLoss"];
        [entity setValue:[NSString stringWithFormat:@"%@",scoreboard.losePitchERA]
                  forKey:@"losePitchERA"];
        
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
