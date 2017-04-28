//
//  ITCShowCommodityView.m
//  LoveBee
//
//  Created by admin on 2017/4/27.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCShowCommodityView.h"
#import "ITCShowCommodityCollectionViewFlowLayout.h"
#import <Masonry.h>
#import "ITCShowCommodityViewCell.h"

#define showCommodityCell_ID @"showCommodityCell_ID"
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define arc4random_color RGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface ITCShowCommodityView () <UICollectionViewDataSource,UICollectionViewDelegate>{}


@property (nonatomic,weak) UICollectionView *collectionView;//

@end


@implementation ITCShowCommodityView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
//    [self setupShowTitleLabelAndAD];//添加TitleLabel //添加大图广告
    
    
    ITCShowCommodityCollectionViewFlowLayout *collectionViewFlowLayout = [[ITCShowCommodityCollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:collectionViewFlowLayout];
    self.collectionView = collectionView;
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"ITCShowCommodityViewCell" bundle:nil] forCellWithReuseIdentifier:showCommodityCell_ID];
    
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    collectionView.backgroundColor = [UIColor lightGrayColor];//调用灰色
    
    
    
    
    
    
    ///添加TitleLabel
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = self.title;
    titleLabel.text = @"休闲零食";
    [titleLabel sizeToFit];
    [self addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(8);
        make.centerX.offset(0);
        //        make.width.offset(40);
        make.height.offset(20);
    }];
    
    
    ///添加大图广告
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.image = [UIImage imageNamed:self.imageADStr];
    //    imageView.image = [UIImage imageNamed:@"v2_placeholder_square"];
    imageView.backgroundColor = arc4random_color;//调用随机色
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(10);
        make.centerX.offset(0);
        make.width.offset(335);
        make.height.offset(100);
    }];
    
    UILabel *moreLabel = [[UILabel alloc] init];
    moreLabel.text = @"更多>";
    [moreLabel sizeToFit];
    [self addSubview:moreLabel];
    
    [moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(8);
        make.right.offset(-8);
        make.height.offset(20);
    }];
    
    
    
    
    
    [self addSubview:collectionView];
    
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.mas_equalTo(imageView.mas_bottom).offset(10);
    }];

}



                                                #pragma mark -  UICollectionViewDataSource  -
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                            cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ITCShowCommodityViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:showCommodityCell_ID forIndexPath:indexPath];
    cell.backgroundColor = arc4random_color;//调用随机色
//    cell.model
    
    return cell;
}
@end
