//
//  BAScoreboard.h
//  BABaseballApplication
//
//  Created by Mac on 9/27/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAScoreboard : NSObject

@property (strong, nonatomic) NSString *gameDate;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *amPM;
@property (strong, nonatomic) NSString *venue;
@property (strong, nonatomic) NSString *awayTeamName;
@property (strong, nonatomic) NSString *awayTeamCity;
@property (strong, nonatomic) NSString *awayTeamAbbr;
@property (strong, nonatomic) NSString *awayWin;
@property (strong, nonatomic) NSString *awayLoss;
@property (strong, nonatomic) NSString *awayGameBack;
@property (strong, nonatomic) NSString *awayGameBackWC;
@property (strong, nonatomic) NSString *awayRun;
@property (strong, nonatomic) NSString *awayHit;
@property (strong, nonatomic) NSString *awayError;
@property (strong, nonatomic) NSString *awayHomeRun;
@property (strong, nonatomic) NSString *awayStrikeOut;
@property (strong, nonatomic) NSString *awayStoleBase;
@property (strong, nonatomic) NSString *homeTeamName;
@property (strong, nonatomic) NSString *homeTeamCity;
@property (strong, nonatomic) NSString *homeTeamAbbr;
@property (strong, nonatomic) NSString *homeWin;
@property (strong, nonatomic) NSString *homeLoss;
@property (strong, nonatomic) NSString *homeGameBack;
@property (strong, nonatomic) NSString *homeGameBackWC;
@property (strong, nonatomic) NSString *homeRun;
@property (strong, nonatomic) NSString *homeHit;
@property (strong, nonatomic) NSString *homeError;
@property (strong, nonatomic) NSString *homeHomeRun;
@property (strong, nonatomic) NSString *homeStrikeOut;
@property (strong, nonatomic) NSString *homeStoleBase;
@property (strong, nonatomic) NSArray  *inning;
@property (strong, nonatomic) NSString *savePitchLastName;
@property (strong, nonatomic) NSString *savePitchFirstName;
@property (strong, nonatomic) NSString *savePitchNumber;
@property (strong, nonatomic) NSString *savePitchWin;
@property (strong, nonatomic) NSString *savePitchSave;
@property (strong, nonatomic) NSString *savePitchLoss;
@property (strong, nonatomic) NSString *savePitchERA;
@property (strong, nonatomic) NSString *winnPitchLastName;
@property (strong, nonatomic) NSString *winnPitchFirstName;
@property (strong, nonatomic) NSString *winnPitchNumber;
@property (strong, nonatomic) NSString *winnPitchWin;
@property (strong, nonatomic) NSString *winnPitchSave;
@property (strong, nonatomic) NSString *winnPitchLoss;
@property (strong, nonatomic) NSString *winnPitchERA;
@property (strong, nonatomic) NSString *losePitchLastName;
@property (strong, nonatomic) NSString *losePitchFirstName;
@property (strong, nonatomic) NSString *losePitchNumber;
@property (strong, nonatomic) NSString *losePitchWin;
@property (strong, nonatomic) NSString *losePitchSave;
@property (strong, nonatomic) NSString *losePitchLoss;
@property (strong, nonatomic) NSString *losePitchERA;

@end
