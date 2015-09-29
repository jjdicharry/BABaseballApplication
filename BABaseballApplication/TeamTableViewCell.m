//
//  TeamTableViewCell.m
//  BABaseballApplication
//
//  Created by Mac on 9/28/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "TeamTableViewCell.h"

#import "Alert.h"
#import "AppDelegate.h"
#import "Favorite.h"

@implementation TeamTableViewCell

/**
 *  Method - awakeFromNib
 */
- (void)awakeFromNib
{
    // Initialization code
}

/**
 *  Method - setSelected:animated:
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Actions

/*
 *  Happens when a favorite button "star icon" is pressed
 */
- (IBAction)favoritePressed:(id)sender
{
    NSError *error;
    NSManagedObject *favorite;
    NSString *name;

    name = self.teamNameLabel.text;
    favorite = [Favorite getByName:name error:&error];

    if (error) {
        [Alert showCoreDataError:error delegate:self.delegate];
        return;
    }

    if (favorite == nil) {
        if (![self addFavorite:name])
            return;
    } else {
        if (![self removeFavorite:favorite])
            return;
    }

    [self.tableView reloadData];
}

#pragma mark - Helper Methods

/**
 *  Adds favorite to database.
 */
- (BOOL)addFavorite:(NSString *)name
{
    NSError *error;
    BOOL result;

    result = [Favorite addByName:name error:&error];

    if (!result)
        [Alert showCoreDataError:error delegate:self.delegate];

    return result;
}

/**
 *  Removes favorite from database.
 */
- (BOOL)removeFavorite:(NSManagedObject *)favorite
{
    NSError *error;
    BOOL result;

    result = [Favorite remove:favorite error:&error];

    if (!result)
        [Alert showCoreDataError:error delegate:self.delegate];

    return result;
}

@end
