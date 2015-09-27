//
//  BAJSONParser.m
//  BABaseballApplication
//
//  Created by Mac on 9/26/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "BAJSONParser.h"
#import "BAScoreboard.h"
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
        NSDictionary *savePitcher     = [gameDictionary objectForKey:@"save_pitcher"];
        NSDictionary *winnPitcher     = [gameDictionary objectForKey:@"winning_pitcher"];
        NSDictionary *losePitcher     = [gameDictionary objectForKey:@"losing_pitcher"];
        NSDictionary *lineScore       = [gameDictionary objectForKey:@"linescore"];
        NSDictionary *homeRunDic      = [lineScore      objectForKey:@"hr"];
        NSDictionary *error           = [lineScore      objectForKey:@"e"];
        NSDictionary *strikeOut       = [lineScore      objectForKey:@"so"];
        NSDictionary *stoleBase       = [lineScore      objectForKey:@"sb"];
        NSDictionary *run             = [lineScore      objectForKey:@"r"];
        NSDictionary *hit             = [lineScore      objectForKey:@"h"];
        BAScoreboard *scoreboard      = [[BAScoreboard alloc] init];
        
        scoreboard.gameDate           = [gameDictionary objectForKey:@"original_date"];
        scoreboard.location           = [gameDictionary objectForKey:@"location"];
        scoreboard.time               = [gameDictionary objectForKey:@"time"];
        scoreboard.amPM               = [gameDictionary objectForKey:@"ampm"];
        scoreboard.venue              = [gameDictionary objectForKey:@"venue"];
        scoreboard.awayTeamName       = [gameDictionary objectForKey:@"away_team_name"];
        scoreboard.awayTeamCity       = [gameDictionary objectForKey:@"away_team_city"];
        scoreboard.awayTeamAbbr       = [gameDictionary objectForKey:@"away_name_abbrev"];
        scoreboard.awayWin            = [gameDictionary objectForKey:@"away_win"];
        scoreboard.awayLoss           = [gameDictionary objectForKey:@"away_loss"];
        scoreboard.awayGameBack       = [gameDictionary objectForKey:@"away_games_back"];
        scoreboard.awayGameBackWC     = [gameDictionary objectForKey:@"away_games_back_wildcard"];
        scoreboard.homeTeamName       = [gameDictionary objectForKey:@"home_team_name"];
        scoreboard.homeTeamCity       = [gameDictionary objectForKey:@"home_team_city"];
        scoreboard.homeTeamAbbr       = [gameDictionary objectForKey:@"home_name_abbrev"];
        scoreboard.homeWin            = [gameDictionary objectForKey:@"home_win"];
        scoreboard.homeLoss           = [gameDictionary objectForKey:@"home_loss"];
        scoreboard.homeGameBack       = [gameDictionary objectForKey:@"home_games_back"];
        scoreboard.homeGameBackWC     = [gameDictionary objectForKey:@"home_games_back_wildcard"];
        scoreboard.inning             = [lineScore   objectForKey:@"inning"];
        scoreboard.savePitchLastName  = [savePitcher objectForKey:@"last"];
        scoreboard.savePitchFirstName = [savePitcher objectForKey:@"first"];
        scoreboard.savePitchNumber    = [savePitcher objectForKey:@"number"];
        scoreboard.savePitchWin       = [savePitcher objectForKey:@"wins"];
        scoreboard.savePitchSave      = [savePitcher objectForKey:@"saves"];
        scoreboard.savePitchLoss      = [savePitcher objectForKey:@"losses"];
        scoreboard.winnPitchLastName  = [winnPitcher objectForKey:@"last"];
        scoreboard.winnPitchFirstName = [winnPitcher objectForKey:@"first"];
        scoreboard.winnPitchNumber    = [winnPitcher objectForKey:@"number"];
        scoreboard.winnPitchWin       = [winnPitcher objectForKey:@"wins"];
        scoreboard.winnPitchSave      = [winnPitcher objectForKey:@"saves"];
        scoreboard.winnPitchLoss      = [winnPitcher objectForKey:@"losses"];
        scoreboard.losePitchLastName  = [losePitcher objectForKey:@"last"];
        scoreboard.losePitchFirstName = [losePitcher objectForKey:@"first"];
        scoreboard.losePitchNumber    = [losePitcher objectForKey:@"number"];
        scoreboard.losePitchWin       = [losePitcher objectForKey:@"wins"];
        scoreboard.losePitchSave      = [losePitcher objectForKey:@"saves"];
        scoreboard.losePitchLoss      = [losePitcher objectForKey:@"losses"];
        scoreboard.awayHomeRun        = [homeRunDic  objectForKey:@"away"];
        scoreboard.awayError          = [error       objectForKey:@"away"];
        scoreboard.awayStrikeOut      = [strikeOut   objectForKey:@"away"];
        scoreboard.awayStoleBase      = [stoleBase   objectForKey:@"away"];
        scoreboard.awayRun            = [run         objectForKey:@"away"];
        scoreboard.awayHit            = [hit         objectForKey:@"away"];
        scoreboard.homeHomeRun        = [homeRunDic  objectForKey:@"home"];
        scoreboard.homeError          = [error       objectForKey:@"home"];
        scoreboard.homeStrikeOut      = [strikeOut   objectForKey:@"home"];
        scoreboard.homeStoleBase      = [stoleBase   objectForKey:@"home"];
        scoreboard.homeRun            = [run         objectForKey:@"home"];
        scoreboard.homeHit            = [hit         objectForKey:@"home"];

        
    }
}

@end
