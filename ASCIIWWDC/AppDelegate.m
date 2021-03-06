//
//  AppDelegate.m
//  ASCIIWWDC
//
//  Created by 汪泽伟 on 2018/5/16.
//  Copyright © 2018年 Wang Zewei. All rights reserved.
//

#import "AppDelegate.h"
#import "ConferencesTableViewController.h"
#import "FavoritesTableViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    NSURLCache *urlCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:100 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:urlCache];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabController = [[UITabBarController alloc] init];
    
    
    ConferencesTableViewController *conferences = [[ConferencesTableViewController alloc] init];
    UINavigationController *conferenceNavigationController = [[UINavigationController alloc] initWithRootViewController:conferences];
    conferenceNavigationController.tabBarItem.title = @"Lists";
    conferenceNavigationController.tabBarItem.image = [UIImage imageNamed:@"Lists"];
    
    FavoritesTableViewController *favoriteTableViewController = [[FavoritesTableViewController alloc] init];
    UINavigationController *favoriteNavigationController = [[UINavigationController alloc] initWithRootViewController:favoriteTableViewController];
    favoriteNavigationController.tabBarItem.title = @"Favorites";
    favoriteNavigationController.tabBarItem.image = [UIImage imageNamed:@"Unfavor"];
    
    tabController.viewControllers = @[conferenceNavigationController, favoriteNavigationController];
    
    self.window.rootViewController = tabController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
