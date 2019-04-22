//
//  AppDelegate.m
//  CustomizeUITabBarDemoThree
//
//  Created by ChenPan on 2019/4/22.
//  Copyright © 2019 ChenPan. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseUITabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1.创建wiondw
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 2创建根控制器
    // 显示TabBarController
    BaseUITabBarController *tabBarVc = [[BaseUITabBarController alloc] init];
    self.window.rootViewController = tabBarVc;
    
    // 3.显示wiondw
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
