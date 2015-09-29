//
//  Favorite.h
//  BABaseballApplication
//
//  Created by Mac on 9/29/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>

@interface Favorite : NSObject

/**
 *  Gets the favorites array from the database.
 */
+ (NSArray *)getAll:(NSError **)error;

/**
 *  Gets a favorite object from the database by team name.
 */
+ (NSManagedObject *)getByName:(NSString *)name error:(NSError **)error;

/**
 *  Removes a favorite object from the database by favorite object.
 */
+ (BOOL)remove:(NSManagedObject *)favorite error:(NSError **)error;

/**
 *  Adds a favorite object to the database by team name.
 */
+ (BOOL)addByName:(NSString *)name error:(NSError **)error;

@end
