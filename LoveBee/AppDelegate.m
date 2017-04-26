//
//  AppDelegate.m
//  LoveBee
//
//  Created by admin on 2017/4/26.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ITCAccountManager.h"
#import <SMS_SDK/SMSSDK.h>
//#import "ITCNavigationController.h"

@interface AppDelegate ()

@property (nonatomic,strong) UIViewController       *rootViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [SMSSDK registerApp:@"1d5d1daeb6300" withSecret:@"a80e2808008f4beeba3c6de5e85cb7fb"];

    [super setupApplication:@"ITCTabBarController"];
//    if ([ITCAccountManager sharedInstance].isLogin) {
//        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
//        ITCNavigationController *loginNaviController = [sb instantiateViewControllerWithIdentifier:@"LoginNaviController"];
        
//    UIViewController *controller = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
//        
//        self.window.rootViewController = controller;
//    }

    

        
        return YES;
}

-(void)enterMain{
    self.window.rootViewController = self.rootViewController;
}

@end
