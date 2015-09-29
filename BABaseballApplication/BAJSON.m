//
//  BAJSONParser.m
//  BABaseballApplication
//
//  Created by Mac on 9/26/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "BAJSON.h"
#import "BACoreData.h"
#import "BAScoreboard.h"

#define mainQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@implementation BAJSON

- (void)parseScoreboardWithYear:(NSString *)year andMonth:(NSString *)month andDay:(NSString *)day {
    NSURL    *url;
    NSString *urlString = @"http://gd2.mlb.com/components/game/mlb/year_";
    
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
        NSDictionary *savePitcher     = [gameDictionary objectForKey:@"save_pitcher"];
        NSDictionary *winnPitcher     = [gameDictionary objectForKey:@"winning_pitcher"];
        NSDictionary *losePitcher     = [gameDictionary objectForKey:@"losing_pitcher"];
        NSDictionary *lineScore       = [gameDictionary objectForKey:@"linescore"];
        NSDictionary *run             = [lineScore      objectForKey:@"r"];
        NSDictionary *hit             = [lineScore      objectForKey:@"h"];
        NSDictionary *error           = [lineScore      objectForKey:@"e"];
        NSDictionary *strikeOut       = [lineScore      objectForKey:@"so"];
        NSDictionary *stoleBase       = [lineScore      objectForKey:@"sb"];
        NSDictionary *homeRunDic      = [lineScore      objectForKey:@"hr"];
        NSArray      *inning          = [lineScore      objectForKey:@"inning"];
        BAScoreboard *scoreboard      = [[BAScoreboard alloc] init];
        
        scoreboard.gameDate           = [gameDictionary  objectForKey:@"original_date"];
        scoreboard.location           = [gameDictionary  objectForKey:@"location"];
        scoreboard.time               = [gameDictionary  objectForKey:@"time"];
        scoreboard.amPM               = [gameDictionary  objectForKey:@"ampm"];
        scoreboard.venue              = [gameDictionary  objectForKey:@"venue"];
        scoreboard.awayTeamName       = [gameDictionary  objectForKey:@"away_team_name"];
        scoreboard.awayTeamCity       = [gameDictionary  objectForKey:@"away_team_city"];
        scoreboard.awayTeamAbbr       = [gameDictionary  objectForKey:@"away_name_abbrev"];
        scoreboard.awayWin            = [[gameDictionary objectForKey:@"away_win"] integerValue];
        scoreboard.awayLoss           = [[gameDictionary objectForKey:@"away_loss"] integerValue];
        scoreboard.awayGameBack       = [NSDecimalNumber decimalNumberWithString:
                                         [gameDictionary objectForKey:@"away_games_back"]];
        scoreboard.awayGameBackWC     = [NSDecimalNumber decimalNumberWithString:
                                         [gameDictionary objectForKey:@"away_games_back_wildcard"]];
        scoreboard.awayRun            = [[run            objectForKey:@"away"] integerValue];
        scoreboard.awayHit            = [[hit            objectForKey:@"away"] integerValue];
        scoreboard.awayError          = [[error          objectForKey:@"away"] integerValue];
        scoreboard.awayStrikeOut      = [[strikeOut      objectForKey:@"away"] integerValue];
        scoreboard.awayStoleBase      = [[stoleBase      objectForKey:@"away"] integerValue];
        scoreboard.awayHomeRun        = [[homeRunDic     objectForKey:@"away"] integerValue];
        scoreboard.homeTeamName       = [gameDictionary  objectForKey:@"home_team_name"];
        scoreboard.homeTeamCity       = [gameDictionary  objectForKey:@"home_team_city"];
        scoreboard.homeTeamAbbr       = [gameDictionary  objectForKey:@"home_name_abbrev"];
        scoreboard.homeWin            = [[gameDictionary objectForKey:@"home_win"] integerValue];
        scoreboard.homeLoss           = [[gameDictionary objectForKey:@"home_loss"] integerValue];
        scoreboard.homeGameBack       = [NSDecimalNumber decimalNumberWithString:
                                         [gameDictionary objectForKey:@"home_games_back"]];
        scoreboard.homeGameBackWC     = [NSDecimalNumber decimalNumberWithString:
                                         [gameDictionary objectForKey:@"home_games_back_wildcard"]];
        scoreboard.homeRun            = [[run            objectForKey:@"home"] integerValue];
        scoreboard.homeHit            = [[hit            objectForKey:@"home"] integerValue];
        scoreboard.homeError          = [[error          objectForKey:@"home"] integerValue];
        scoreboard.homeStrikeOut      = [[strikeOut      objectForKey:@"home"] integerValue];
        scoreboard.homeStoleBase      = [[stoleBase      objectForKey:@"home"] integerValue];
        scoreboard.homeHomeRun        = [[homeRunDic     objectForKey:@"home"] integerValue];
        scoreboard.savePitchLastName  = [savePitcher     objectForKey:@"last"];
        scoreboard.savePitchFirstName = [savePitcher     objectForKey:@"first"];
        scoreboard.savePitchNumber    = [[savePitcher    objectForKey:@"number"] integerValue];
        scoreboard.savePitchWin       = [[savePitcher    objectForKey:@"wins"]   integerValue];
        scoreboard.savePitchSave      = [[savePitcher    objectForKey:@"saves"]  integerValue];
        scoreboard.savePitchLoss      = [[savePitcher    objectForKey:@"losses"] integerValue];
        scoreboard.savePitchERA       = [NSDecimalNumber decimalNumberWithString:
                                         [savePitcher    objectForKey:@"era"]];
        scoreboard.winnPitchLastName  = [winnPitcher     objectForKey:@"last"];
        scoreboard.winnPitchFirstName = [winnPitcher     objectForKey:@"first"];
        scoreboard.winnPitchNumber    = [[winnPitcher    objectForKey:@"number"] integerValue];
        scoreboard.winnPitchWin       = [[winnPitcher    objectForKey:@"wins"]   integerValue];
        scoreboard.winnPitchSave      = [[winnPitcher    objectForKey:@"saves"]  integerValue];
        scoreboard.winnPitchLoss      = [[winnPitcher    objectForKey:@"losses"] integerValue];
        scoreboard.winnPitchERA       = [NSDecimalNumber decimalNumberWithString:
                                         [winnPitcher    objectForKey:@"era"]];
        scoreboard.losePitchLastName  = [losePitcher     objectForKey:@"last"];
        scoreboard.losePitchFirstName = [losePitcher     objectForKey:@"first"];
        scoreboard.losePitchNumber    = [[losePitcher    objectForKey:@"number"] integerValue];
        scoreboard.losePitchWin       = [[losePitcher    objectForKey:@"wins"]   integerValue];
        scoreboard.losePitchSave      = [[losePitcher    objectForKey:@"saves"]  integerValue];
        scoreboard.losePitchLoss      = [[losePitcher    objectForKey:@"losses"] integerValue];
        scoreboard.losePitchERA       = [NSDecimalNumber decimalNumberWithString:
                                         [losePitcher    objectForKey:@"era"]];

        int i = 0;
        for (NSDictionary *inningDictionary in inning) {
            NSString *away = [inningDictionary objectForKey:@"away"];
            NSString *home = [inningDictionary objectForKey:@"home"];
            
            i++;
            switch (i) {
                case 1:
                    scoreboard.awayInni01 = [away integerValue];
                    scoreboard.homeInni01 = [home integerValue];
                    break;
                case 2:
                    scoreboard.awayInni02 = [away integerValue];
                    scoreboard.homeInni02 = [home integerValue];
                    break;
                case 3:
                    scoreboard.awayInni03 = [away integerValue];
                    scoreboard.homeInni03 = [home integerValue];
                    break;
                case 4:
                    scoreboard.awayInni04 = [away integerValue];
                    scoreboard.homeInni04 = [home integerValue];
                    break;
                case 5:
                    scoreboard.awayInni05 = [away integerValue];
                    scoreboard.homeInni05 = [home integerValue];
                    break;
                case 6:
                    scoreboard.awayInni06 = [away integerValue];
                    scoreboard.homeInni06 = [home integerValue];
                    break;
                case 7:
                    scoreboard.awayInni07 = [away integerValue];
                    scoreboard.homeInni07 = [home integerValue];
                    break;
                case 8:
                    scoreboard.awayInni08 = [away integerValue];
                    scoreboard.homeInni08 = [home integerValue];
                    break;
                case 9:
                    scoreboard.awayInni09 = [away integerValue];
                    scoreboard.homeInni09 = [home integerValue];
                    break;
                default:
                    scoreboard.awayInniEx = [away integerValue];
                    scoreboard.homeInniEx = [home integerValue];
                    break;
            }
        }
        
        BACoreData *coreData = [[BACoreData alloc] init];
        [coreData insScoreboardWithDate:scoreboard.gameDate
                            andTime:scoreboard.time
                        andHomeTeam:scoreboard.homeTeamAbbr];
    }
}
@end
