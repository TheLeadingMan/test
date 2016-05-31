//
//  AppDelegate.m
//  DYZSpeciallyEffect
//
//  Created by dyz on 16/5/16.
//  Copyright © 2016年 DYZ. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"党玉柱" image:nil selectedImage:nil];
    
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:[ViewControllerTwo new]];
    nav1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"党玉柱1" image:nil selectedImage:nil];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:[ViewControllerThree new]];
    nav2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"党玉柱2" image:nil selectedImage:nil];
    self.window.backgroundColor = [UIColor whiteColor];
    UITabBarController *tabVC = [[UITabBarController alloc]init];
    tabVC.viewControllers = @[nav,nav1,nav2];
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    
    
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
