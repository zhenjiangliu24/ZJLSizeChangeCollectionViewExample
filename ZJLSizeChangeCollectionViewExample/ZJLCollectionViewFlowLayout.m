//
//  ZJLCollectionViewFlowLayout.m
//  ZJLSizeChangeCollectionViewExample
//
//  Created by ZhongZhongzhong on 16/6/12.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "ZJLCollectionViewFlowLayout.h"

@implementation ZJLCollectionViewFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (void)prepareLayout
{
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat insetGap = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, insetGap, 0, insetGap);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *original = [super layoutAttributesForElementsInRect:rect];
    NSArray *arr = [[NSArray alloc] initWithArray:original copyItems:YES];
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    for (UICollectionViewLayoutAttributes *attributes in arr)
    {
        CGFloat gapX = ABS(attributes.center.x - centerX);
        CGFloat scale = 1 - gapX / self.collectionView.frame.size.width;
        attributes.transform = CGAffineTransformMakeScale(scale, scale);        
    }
    
    return arr;
    
}
@end
