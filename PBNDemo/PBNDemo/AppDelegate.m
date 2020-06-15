//
//  AppDelegate.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/15.
//  Copyright © 2020 常威. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MainTabBarViewController *mainTabBarViewCotroller = [[MainTabBarViewController alloc] init];
    self.window.rootViewController = mainTabBarViewCotroller;
    
    [self.window makeKeyAndVisible];

    return YES;
}



@end
