//
//  AMAppDelegate.m
//  Sample
//
//  Created by Andrea Mazzini on 08/02/14.
//  Copyright (c) 2014 Fancy Pixel. All rights reserved.
//

#import "AMAppDelegate.h"

@implementation AMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
	[[UIApplication sharedApplication] setStatusBarHidden:NO];
	[[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:49.0/255.0 green:186.0/255.0 blue:81.0/255.0 alpha:1]];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
	[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
	NSDictionary *attributes = @{ NSFontAttributeName: [UIFont fontWithName:@"Futura" size:18],
								  NSForegroundColorAttributeName: [UIColor whiteColor]};
	[[UINavigationBar appearance] setTitleTextAttributes:attributes];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
