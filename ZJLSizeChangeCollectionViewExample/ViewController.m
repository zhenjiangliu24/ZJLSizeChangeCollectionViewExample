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
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) ZJLCollectionViewFlowLayout *layout;
@property (nonatomic, strong) UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layout = [[ZJLCollectionViewFlowLayout alloc]init];
    self.layout.itemSize = CGSizeMake(150, 150);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, ScreenHeight-100) collectionViewLayout:self.layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZJLCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"my_cell"];
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(0, (ScreenWidth-200)/2, 200, 50)];
    self.slider.minimumValue = 0;
    self.slider.maximumValue = 100;
    self.slider.value = 0;
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider];
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

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGFloat insetGap = (self.collectionView.frame.size.width - self.layout.itemSize.width) * 0.5;
    return UIEdgeInsetsMake(self.slider.value, insetGap, self.slider.value, insetGap);
}

- (void)sliderValueChanged:(id)sender
{
    CGFloat insetGap = (self.collectionView.frame.size.width - self.layout.itemSize.width) * 0.5;
    self.layout.sectionInset = UIEdgeInsetsMake(self.slider.value, insetGap, self.slider.value, insetGap);
    [self.collectionView reloadData];
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
