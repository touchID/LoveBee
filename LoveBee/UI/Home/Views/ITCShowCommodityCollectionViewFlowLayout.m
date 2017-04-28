//
//  ITCShowCommodityCollectionViewFlowLayout.m
//  LoveBee
//
//  Created by admin on 2017/4/27.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCShowCommodityCollectionViewFlowLayout.h"

@implementation ITCShowCommodityCollectionViewFlowLayout

//collectionView准备布局的时候,会调用这个方法
- (void)prepareLayout{
    [super prepareLayout];
    
    //计算collectionViewCell的大小
    CGFloat width = (self.collectionView.frame.size.width - 4) / 3;
    
    self.itemSize = CGSizeMake(width, self.collectionView.bounds.size.height);
    
    //设置collectionView的组间距为0
    self.sectionInset = UIEdgeInsetsZero;
    
    //设置cell之间的最小间距
    self.minimumInteritemSpacing = 1;
    //设置cell之间的最小行间距
    self.minimumLineSpacing = 1;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}


@end
