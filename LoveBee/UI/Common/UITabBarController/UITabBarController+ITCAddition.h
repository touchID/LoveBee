//
//  UITabBarController+ITCAddition.h
//  UI122601支付宝
//
//  Created by admin on 2016/12/26.
//  Copyright © 2016年 ITC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (ITCAddition)

+ (UIViewController *)itc_navControllerWithSbName:(NSString *)sbName title:(NSString *)title imageName:(NSString *)imageName;

+(UIViewController *)itc_navControllerWithClassName:(NSString *)clzName title:(NSString *)title imageName:(NSString *)imageName;

+(UINavigationController *)itc_addChildControllerWith:(NSString *)clzName title:(NSString *)title imageName:(NSString *)imageName;

@end
