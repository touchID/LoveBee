//
//  UITabBarController+ITCAddition.m
//  UI122601支付宝
//
//  Created by admin on 2016/12/26.
//  Copyright © 2016年 ITC. All rights reserved.
//

#import "UITabBarController+ITCAddition.h"
#import "ITCNavigationController.h"


@implementation UITabBarController (ITCAddition)

+ (UIViewController *)itc_navControllerWithSbName:(NSString *)sbName title:(NSString *)title imageName:(NSString *)imageName{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    
    UIViewController *controller = [sb instantiateInitialViewController];
    
    ITCNavigationController *navController = [[ITCNavigationController alloc] initWithRootViewController:controller];
    
    return [self controllerWithNavCotroller:navController title:title imagName:imageName];
}

+(UIViewController *)itc_navControllerWithClassName:(NSString *)clzName title:(NSString *)title imageName:(NSString *)imageName{
    Class clz = NSClassFromString(clzName);
    UIViewController *controller = [[clz alloc] init];
    ITCNavigationController *navController = [[ITCNavigationController alloc] initWithRootViewController:controller];
    
    return [self controllerWithNavCotroller:navController title:title imagName:imageName];
}

+(UIViewController *)controllerWithNavCotroller:(UIViewController *)navController title:(NSString *)title imagName:(NSString *)imageName{
    navController.title = title;
    navController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navController.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navController.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);

    [navController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateSelected];//将字 变成隐藏颜色

    return navController;
}

/**
 添加导航控制器, 默认导航条样式
 */
+(ITCNavigationController *)itc_addChildControllerWith:(NSString *)clzName title:(NSString *)title imageName:(NSString *)imageName{
    Class clz= NSClassFromString(clzName);
    UIViewController *controller = [[clz alloc] init];
    ITCNavigationController *nav = [[ITCNavigationController alloc] initWithRootViewController:controller];
//    controller.title = title;
    
    controller.tabBarItem.image = [UIImage imageNamed:imageName];//未选中的图片样式
    
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//选中的图片样式
    controller.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);

    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor clearColor]} forState:UIControlStateSelected];//将字 变成隐藏颜色
    
    
    return nav;
}
@end
