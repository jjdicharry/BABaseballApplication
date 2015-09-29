//
//  Favorite.m
//  BABaseballApplication
//
//  Created by Mac on 9/29/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "Favorite.h"

#import "AppDelegate.h"

@implementation Favorite

/*
 *  Gets the favorites array from the database.
 */
+ (NSArray *)getAll:(NSError **)error
{
    NSManagedObjectContext *context;
    NSEntityDescription *entity;
    NSFetchRequest *request;
    NSArray *favorites;

    context = [Favorite getContext];
    entity = [NSEntityDescription entityForName:@"Favorite"
                         inManagedObjectContext:context];
    request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];

    favorites = [context executeFetchRequest:request error:error];
    return favorites;
}

/*
 *  Gets a favorite object from the database by team name.
 */
+ (NSManagedObject *)getByName:(NSString *)name error:(NSError **)error
{
    NSManagedObjectContext *context;
    NSEntityDescription *entity;
    NSPredicate *predicate;
    NSFetchRequest *request;
    NSArray *objects;
    NSManagedObject *match;

    context = [Favorite getContext];

    entity = [NSEntityDescription entityForName:@"Favorite"
                         inManagedObjectContext        :context];

    predicate = [NSPredicate predicateWithFormat:@"(name = %@)", name];

    request = [[NSFetchRequest alloc] init];

    [request setEntity:entity];
    [request setPredicate:predicate];

    objects = [context executeFetchRequest:request error:error];

    if (objects.count == 0)
        match = nil;
    else
        match = [objects objectAtIndex:0];

    return match;
}

/*
 *  Removes a favorite object from the database by favorite object.
 */
+ (BOOL)remove:(NSManagedObject *)favorite error:(NSError **)error
{
    NSManagedObjectContext *context;
    context = [Favorite getContext];

    [context deleteObject:favorite];

    return [context save:error];
}

/*
 *  Adds a favorite object to the database by team name.
 */
+ (BOOL)addByName:(NSString *)name error:(NSError **)error
{
    NSManagedObjectContext *context;
    NSManagedObject *favorite;

    context = [Favorite getContext];

    favorite =
        [NSEntityDescription insertNewObjectForEntityForName:@"Favorite"
                                      inManagedObjectContext:context];

    [favorite setValue:name forKey:@"name"];

    return [context save:error];
}

#pragma mark - Helper Methods

/**
 *  Gets the database context
 */
+ (NSManagedObjectContext *)getContext
{
    AppDelegate *ad;
    NSManagedObjectContext *context;
    ad = [[UIApplication sharedApplication] delegate];
    context = [ad managedObjectContext];
    return context;
}

@end
