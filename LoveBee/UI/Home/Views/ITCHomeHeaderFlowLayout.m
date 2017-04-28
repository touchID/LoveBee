//
//  ITCHomeHeaderFlowLayout.m
//  LoveBee
//
//  Created by admin on 2017/4/27.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCHomeHeaderFlowLayout.h"

@implementation ITCHomeHeaderFlowLayout

//collectionView准备布局的时候,会调用这个方法
- (void)prepareLayout{
    [super prepareLayout];
    
    //计算collectionViewCell的大小
    CGFloat width = (self.collectionView.frame.size.width - 0) / 4;
    
    self.itemSize = CGSizeMake(width, self.collectionView.bounds.size.height);
    
    //设置collectionView的组间距为0
    self.sectionInset = UIEdgeInsetsZero;
    
    //设置cell之间的最小间距
    self.minimumInteritemSpacing = 0;
    //设置cell之间的最小行间距
    self.minimumLineSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
}


@end
