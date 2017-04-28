//
//  ITCHomeHeaderView.m
//  LoveBee
//
//  Created by admin on 2017/4/27.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//
#import "ITCHomeHeaderCell.h"
#import <Masonry.h>
#import "ITCHomeHeaderView.h"
#import <SDCycleScrollView.h>
#import <UIImageView+WebCache.h>
#import "ITCHomeHeaderFlowLayout.h"
#import "ITCHomeHeaderTypeServices.h"

#define HeaderCell_ID @"HeaderCell_ID"
@interface ITCHomeHeaderView () <SDCycleScrollViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) NSArray<ITCHomeHeaderTypeServices *> *array;//

@end

@implementation ITCHomeHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}

-(void)setupUI{
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
    NSArray *imagesURLStrings = @[@"http://img01.bqstatic.com//upload/activity/2017042515590063.jpg@90Q.jpg",@"http://img01.bqstatic.com//upload/activity/2017040517374943.jpg@90Q.jpg",@"http://img01.bqstatic.com//upload/activity/2016123018095821.jpg@90Q.jpg"];
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
//    [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:news.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];

    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;// 翻页 中间下角
    cycleScrollView.autoScrollTimeInterval = 2;// 自动滚动时间间隔
    [SDCycleScrollView clearImagesCache];// 清除缓存。
    
    ITCHomeHeaderFlowLayout *collectionViewFlowLayout = [[ITCHomeHeaderFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:collectionViewFlowLayout];
    
    collectionView.dataSource = self;
    
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:HeaderCell_ID];
    [collectionView registerNib:[UINib nibWithNibName:@"ITCHomeHeaderCell" bundle:nil] forCellWithReuseIdentifier:HeaderCell_ID];

    collectionView.showsHorizontalScrollIndicator = NO;
    
    [self addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.offset(100);
        
    }];
    
    [self addSubview:cycleScrollView];
    [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.offset(0);
//        make.bottom.offset(-100);
        make.bottom.equalTo(collectionView.mas_top).offset(0);
    }];
}


                                                #pragma mark -  UICollectionViewDataSource  -
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ITCHomeHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HeaderCell_ID forIndexPath:indexPath];
    
    cell.backgroundColor = arc4random_color;//调用随机色
    
    
    return cell;
}


@end
