//
//  AppDelegate.m
//  BABaseballApplication
//
//  Created by Mac on 9/26/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


/**
 *  Method - application:didFinishLaunchingWithOptions:
 */
- (BOOL)              application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}

/**
 *  Method - applicationWillResignActive:
 */
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive
    // state. This can occur for certain types of temporary interruptions
    // (such as an incoming phone call or SMS message) or when the user
    // quits the application and it begins the transition to the background
    // state.
    // Use this method to pause ongoing tasks, disable timers, and throttle
    // down OpenGL ES frame rates. Games should use this method to pause
    // the game.
}

/**
 *  Method - applicationDidEnterBackground:
 */
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data,
    // invalidate timers, and store enough application state information to
    // restore your application to its current state in case it is
    // terminated later.
    // If your application supports background execution, this method is
    // called instead of applicationWillTerminate: when the user quits.
}

/**
 *  Method - applicationWillEnterForeground:
 */
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive
    // state; here you can undo many of the changes made on entering the
    // background.
}

/**
 *  Method - applicationDidBecomeActive:
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the
    // application was inactive. If the application was previously in the
    // background, optionally refresh the user interface.
}

/**
 *  Method - applicationWillTerminate:
 */
- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if
    // appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the
    // application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

/**
 *  The directory the application uses to store the Core Data store file.
 *  This method uses a directory named "com.mac.BABaseballApplication" in the
 *  application's documents directory.
 *
 *  @return URL/Path to Application Documents Directory
 */
- (NSURL *)applicationDocumentsDirectory
{
    NSFileManager *manager;
    NSSearchPathDirectory dir;
    NSSearchPathDomainMask mask;
    NSArray *urls;

    manager = [NSFileManager defaultManager];
    dir = NSDocumentDirectory;
    mask = NSUserDomainMask;
    urls = [manager URLsForDirectory:dir inDomains:mask];

    return [urls lastObject];
}

/**
 *  Method - managedObjectModel
 *
 *  @return The managed object model for the core data.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    NSString *resource = @"BABaseballApplication";
    NSString *extension = @"momd";

    NSManagedObjectModel *model;
    NSBundle *bundle;
    NSURL *modelURL;

    model = _managedObjectModel;

    // The managed object model for the application. It is a fatal error
    // for the application not to be able to find and load its model.
    if (model != nil)
        return model;

    bundle = [NSBundle mainBundle];
    modelURL = [bundle URLForResource:resource withExtension:extension];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    _managedObjectModel = model;

    return model;
}

/**
 *  Method - persistentStoreCoordinator
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    NSPersistentStoreCoordinator *coordinator;
    NSManagedObjectModel *model;
    NSURL *storeURL;
    NSURL *dir;
    NSString *dbname;
    NSError *error;
    NSString *failureReason;
    NSPersistentStore *store;

    coordinator = _persistentStoreCoordinator;

    // The persistent store coordinator for the application. This
    // implementation creates and returns a coordinator, having added the
    // store for the application to it.
    if (coordinator != nil)
        return coordinator;

    // Create the coordinator and store
    model = self.managedObjectModel;
    coordinator = [NSPersistentStoreCoordinator alloc];
    coordinator = [coordinator initWithManagedObjectModel:model];

    dir = [self applicationDocumentsDirectory];
    dbname = @"BABaseballApplication.sqlite";
    storeURL = [dir URLByAppendingPathComponent:dbname];

    error = nil;

    failureReason = @"There was an error creating or loading the "
                    "application's saved data.";

    store = [coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                      configuration:nil
                                                URL:storeURL
                                            options:nil
                                              error:&error];

    if (!store) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] =
            @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;

        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN"
                                    code:9999
                                userInfo:dict];

        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and
        // terminate. You should not use this function in a shipping
        // application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    _persistentStoreCoordinator = coordinator;

    return coordinator;
}


/**
 *  Method - managedObjectContext
 */
- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context;
    NSPersistentStoreCoordinator *coordinator;
    NSManagedObjectContextConcurrencyType type;

    context = _managedObjectContext;

    // Returns the managed object context for the application (which is
    // already bound to the persistent store coordinator for the
    // application.)
    if (context != nil)
        return context;

    coordinator = [self persistentStoreCoordinator];

    if (!coordinator)
        return nil;

    type = NSMainQueueConcurrencyType;
    context =
        [[NSManagedObjectContext alloc] initWithConcurrencyType:type];

    [context setPersistentStoreCoordinator:coordinator];
    _managedObjectContext = context;

    return context;
}

#pragma mark - Core Data Saving support

/**
 *  Method - saveContext
 */
- (void)saveContext
{
    NSDictionary *userinfo;
    NSError *error;

    NSManagedObjectContext *context = self.managedObjectContext;

    if (context != nil) {

        error = nil;

        if ([context hasChanges] && ![context save:&error]) {
            // Replace this implementation with code to handle the
            // error appropriately.
            // abort() causes the application to generate a crash
            // log and terminate. You should not use this function
            // in a shipping application, although it may be useful
            // during development.
            userinfo = [error userInfo];
            NSLog(@"Unresolved error %@, %@", error, userinfo);
            abort();
        }
    }
}

@end
