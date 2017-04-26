//
//  ITCAppDelegate.h
//  UI0106进阶第一天
//
//  Created by admin on 2017/1/6.
//  Copyright © 2017年 ITC. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ITCAppDelegate.h"
//@interface AppDelegate : ITCAppDelegate
@interface ITCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(void)setupApplication:(NSString *)clzName;

@end

