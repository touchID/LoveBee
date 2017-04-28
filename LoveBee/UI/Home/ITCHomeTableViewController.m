//
//  ITCHomeTableViewController.m
//  LoveBee
//
//  Created by admin on 2017/4/26.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCHomeTableViewController.h"
#import "ITCHomeWebServices.h"
#import "ITCHomeTableViewCell.h"
#import "ITCShowCommodityView.h"

#define homeCell_ID @"homeCell_ID"

@interface ITCHomeTableViewController ()

@end

@implementation ITCHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];


//    [self.tableView registerNib:[UINib nibWithNibName:@"ITCHomeTableViewCell" bundle:nil] forCellReuseIdentifier:homeCell_ID];
    [self.tableView registerClass:[ITCHomeTableViewCell class] forCellReuseIdentifier:homeCell_ID];
    
    self.automaticallyAdjustsScrollViewInsets = NO;// iOS7.0的特性 : 当滚动视图及其子类(UIScrollView/UIWebView/UITablewView/UICollectionView/UITexeView...)在自动布局时,遇到导航,里面的内容会自动的向下偏移64像素.
    
    [self setupHeaderView];//设置头部视图
    

    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
                                                        #pragma mark -  下午4:24 设置头部视图  -
- (void)setupHeaderView{
    //bundle设置为nil,代表使用默认bundle,也就是[NSBundle mainBundle]
    UIView *headerView = [[[UINib nibWithNibName:@"HomeHeaderView" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
    self.tableView.tableHeaderView = headerView;
}

-(void)loadData{
    ITCHomeWebServices *homeWebServices = [[ITCHomeWebServices alloc] init];
    [homeWebServices execRequestWithSuccBlock:^(id responseData) {
        NSLog(@"%@", responseData);
    } failBlock:^(NSError *error) {
        if (error) {
            NSLog(@"error = %@", error);
        }
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ITCHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCell_ID forIndexPath:indexPath];

    ITCShowCommodityView *showCommodityView = [[ITCShowCommodityView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 380)];
    [cell.contentView addSubview:showCommodityView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//去掉cell选中样式
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat cellH;
    // 根据每行不同的模型数据,选择展示对应的cell的高度
    cellH = 400;
    
    return cellH;
}


@end
