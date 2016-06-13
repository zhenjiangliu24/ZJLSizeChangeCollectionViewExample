//
//  ViewController.m
//  ZJLSizeChangeCollectionViewExample
//
//  Created by ZhongZhongzhong on 16/6/12.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "ViewController.h"
#import "ZJLCollectionViewFlowLayout.h"
#import "ZJLCollectionViewCell.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, copy) NSArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZJLCollectionViewFlowLayout *layout = [[ZJLCollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(150, 150);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
    [collectionView registerNib:[UINib nibWithNibName:@"ZJLCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"my_cell"];
    self.data = [NSArray arrayWithObjects:@"Montreal",@"Toronto",@"Ottawa",@"Calgary",@"Vancouver",@"Quebec city", nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZJLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"my_cell" forIndexPath:indexPath];
    cell.titleLabel.text = self.data[indexPath.row];
    cell.backgroundColor = [self randomColor];
    return cell;
}

- (UIColor *)randomColor
{
    CGFloat red = arc4random()%256/256.0;
    CGFloat green = arc4random()%256/256.0;
    CGFloat blue = arc4random()%256/256.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
