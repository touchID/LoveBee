//
//  ITCAppDelegate.m
//  UI0106进阶第一天
//
//  Created by admin on 2017/1/6.
//  Copyright © 2017年 ITC. All rights reserved.
//

#import "ITCAppDelegate.h"
@interface ITCAppDelegate ()

@end

@implementation ITCAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}

-(void)setupApplication:(NSString *)clzName{
    Class clz = NSClassFromString(clzName);//将字符串转化成class
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController *tabBarController = [[clz alloc] init];
    
    
//引导页判断
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Guide" bundle:nil];
//    UIViewController *controller = [sb instantiateInitialViewController];
//    self.window.rootViewController = [self selectRoot] ? controller :tabBarController;
    
//无引导页
    self.window.rootViewController = tabBarController;

    [self.window makeKeyAndVisible];
}

// 首启动根控制器选择
- (Boolean)selectRoot{
    //根据版本号判断是否首次启动,选择启动控制器
    NSUserDefaults* defaulut = [NSUserDefaults standardUserDefaults];
    
    // 获取当前的手机应用的版本号
    NSDictionary* dict = [NSBundle mainBundle].infoDictionary;
    NSString* appVersion = dict[@"CFBundleShortVersionString"];
    
    // 获取上一次手机的版本号
    NSString* lastVersion = [defaulut objectForKey:@"appVersion"];
    
//    UIViewController * mainController;
    
    [defaulut setObject:appVersion forKey:@"appVersion"];
    [defaulut synchronize];
    
    //判断版本号,选择控制器
    if (![lastVersion isEqualToString:appVersion]) {
        NSLog(@"第一次启动");
        return true;
    }

    return false;

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
