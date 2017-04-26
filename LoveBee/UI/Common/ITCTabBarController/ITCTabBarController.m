//
//  ITCTabBarController.m
//  咕咕咕咚
//
//  Created by admin on 2017/4/23.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCTabBarController.h"
#import "UITabBarController+ITCAddition.h"

@interface ITCTabBarController ()

@end

@implementation ITCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addChildViewControllers];
    
}
-(void)addChildViewControllers{
    UIViewController *homeNavController = [UITabBarController itc_navControllerWithSbName:@"Home" title:@"首页" imageName:@"v2_home"];
    //[UITabBarController itc_addChildControllerWith:@"ITCHomeTableViewController" title:@"首页"  imageName:@"v2_home"];
    [self addChildViewController:homeNavController];
//    UIViewController *discoverNavController = [UITabBarController itc_addChildControllerWith:@"ITCSupermarketTableViewController" title:@"闪送超市"  imageName:@"v2_order"];
//    [self addChildViewController:discoverNavController];
//    
//    UIViewController *messageNavController = [UITabBarController itc_addChildControllerWith:@"ITCShoppingCartTableViewController" title:@"购物车"  imageName:@"shopCart"];
//    [self addChildViewController:messageNavController];
    UIViewController *mineNavController = [UITabBarController itc_navControllerWithSbName:@"Mine" title:@"我的" imageName:@"v2_my"];
    
    //[UITabBarController itc_addChildControllerWith:@"ITCMineViewController" title:@"我的"  imageName:@"v2_my"];
    [self addChildViewController:mineNavController];
}


@end
