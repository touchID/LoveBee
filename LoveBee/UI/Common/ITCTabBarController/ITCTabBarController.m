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
    //首页
    UIViewController *homeNavController = [UITabBarController itc_navControllerWithSbName:@"Home" title:@"首页" imageName:@"v2_home"];
    [self addChildViewController:homeNavController];
    
    //"闪送超市"
    UIViewController *supermarketNavController = [UITabBarController itc_addChildControllerWith:@"ITCSupermarketController" title:@"闪送超市"  imageName:@"v2_order"];
    [self addChildViewController:supermarketNavController];

    //购物车
    UIViewController *shoppingCartNavController = [UITabBarController itc_addChildControllerWith:@"ITCShoppingCartTableViewController" title:@"购物车"  imageName:@"shopCart"];
    [self addChildViewController:shoppingCartNavController];
    
    //我的
    UIViewController *mineNavController = [UITabBarController itc_navControllerWithSbName:@"Mine" title:@"我的" imageName:@"v2_my"];
    [self addChildViewController:mineNavController];
}


@end
