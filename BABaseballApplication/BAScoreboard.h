//
//  BAScoreboard.h
//  BABaseballApplication
//
//  Created by Mac on 9/27/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAScoreboard : NSObject

@property (strong, nonatomic) NSString        *gameDate;
@property (strong, nonatomic) NSString        *location;
@property (strong, nonatomic) NSString        *time;
@property (strong, nonatomic) NSString        *amPM;
@property (strong, nonatomic) NSString        *venue;
@property (strong, nonatomic) NSString        *awayTeamName;
@property (strong, nonatomic) NSString        *awayTeamCity;
@property (strong, nonatomic) NSString        *awayTeamAbbr;
@property (nonatomic)         NSInteger        awayWin;
@property (nonatomic)         NSInteger        awayLoss;
@property (nonatomic)         NSDecimalNumber *awayGameBack;
@property (nonatomic)         NSDecimalNumber *awayGameBackWC;
@property (nonatomic)         NSInteger        awayRun;
@property (nonatomic)         NSInteger        awayHit;
@property (nonatomic)         NSInteger        awayError;
@property (nonatomic)         NSInteger        awayHomeRun;
@property (nonatomic)         NSInteger        awayStrikeOut;
@property (nonatomic)         NSInteger        awayStoleBase;
@property (nonatomic)         NSInteger        awayInni01;
@property (nonatomic)         NSInteger        awayInni02;
@property (nonatomic)         NSInteger        awayInni03;
@property (nonatomic)         NSInteger        awayInni04;
@property (nonatomic)         NSInteger        awayInni05;
@property (nonatomic)         NSInteger        awayInni06;
@property (nonatomic)         NSInteger        awayInni07;
@property (nonatomic)         NSInteger        awayInni08;
@property (nonatomic)         NSInteger        awayInni09;
@property (nonatomic)         NSInteger        awayInniEx;
@property (strong, nonatomic) NSString        *homeTeamName;
@property (strong, nonatomic) NSString        *homeTeamCity;
@property (strong, nonatomic) NSString        *homeTeamAbbr;
@property (nonatomic)         NSInteger        homeWin;
@property (nonatomic)         NSInteger        homeLoss;
@property (nonatomic)         NSDecimalNumber *homeGameBack;
@property (nonatomic)         NSDecimalNumber *homeGameBackWC;
@property (nonatomic)         NSInteger        homeRun;
@property (nonatomic)         NSInteger        homeHit;
@property (nonatomic)         NSInteger        homeError;
@property (nonatomic)         NSInteger        homeHomeRun;
@property (nonatomic)         NSInteger        homeStrikeOut;
@property (nonatomic)         NSInteger        homeStoleBase;
@property (nonatomic)         NSInteger        homeInni01;
@property (nonatomic)         NSInteger        homeInni02;
@property (nonatomic)         NSInteger        homeInni03;
@property (nonatomic)         NSInteger        homeInni04;
@property (nonatomic)         NSInteger        homeInni05;
@property (nonatomic)         NSInteger        homeInni06;
@property (nonatomic)         NSInteger        homeInni07;
@property (nonatomic)         NSInteger        homeInni08;
@property (nonatomic)         NSInteger        homeInni09;
@property (nonatomic)         NSInteger        homeInniEx;
@property (strong, nonatomic) NSString        *savePitchLastName;
@property (strong, nonatomic) NSString        *savePitchFirstName;
@property (nonatomic)         NSInteger        savePitchNumber;
@property (nonatomic)         NSInteger        savePitchWin;
@property (nonatomic)         NSInteger        savePitchSave;
@property (nonatomic)         NSInteger        savePitchLoss;
@property (strong, nonatomic) NSDecimalNumber *savePitchERA;
@property (strong, nonatomic) NSString        *winnPitchLastName;
@property (strong, nonatomic) NSString        *winnPitchFirstName;
@property (nonatomic)         NSInteger        winnPitchNumber;
@property (nonatomic)         NSInteger        winnPitchWin;
@property (nonatomic)         NSInteger        winnPitchSave;
@property (nonatomic)         NSInteger        winnPitchLoss;
@property (strong, nonatomic) NSDecimalNumber *winnPitchERA;
@property (strong, nonatomic) NSString        *losePitchLastName;
@property (strong, nonatomic) NSString        *losePitchFirstName;
@property (nonatomic)         NSInteger        losePitchNumber;
@property (nonatomic)         NSInteger        losePitchWin;
@property (nonatomic)         NSInteger        losePitchSave;
@property (nonatomic)         NSInteger        losePitchLoss;
@property (strong, nonatomic) NSDecimalNumber *losePitchERA;

@end
