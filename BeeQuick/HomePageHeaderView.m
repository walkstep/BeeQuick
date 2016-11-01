//
//  HomePageHeaderView.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/31.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "HomePageHeaderView.h"

#import "HomePageMenuCell.h"

@interface HomePageHeaderView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end


@implementation HomePageHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        // 轮播图
        //        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageURLStringsGroup:_urlArr];
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageNamesGroup:@[[UIImage imageNamed:@"scrollImg1"], [UIImage imageNamed:@"scollImg2"]]];
        _cycleScrollView.pageDotColor = COLOR_WITH_HEX(kColorWhite);
        _cycleScrollView.currentPageDotColor = COLOR_WITH_HEX(kColorNavigationYellow);
        _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _cycleScrollView.autoScrollTimeInterval = 5;
        
        // menu选项
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _menuCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _menuCollectionView.backgroundColor = COLOR_WITH_HEX(kColorWhite);
        
        // 注册cell
        [_menuCollectionView registerClass:[HomePageMenuCell  class] forCellWithReuseIdentifier:NSStringFromClass([HomePageMenuCell class])];
        
        
        [self addSubview:_cycleScrollView];
        [self addSubview:_menuCollectionView];
        
        /* ----------约束---------- */
        [_cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.mas_equalTo(0);
            make.height.mas_equalTo(180);
        }];
        
        [_menuCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.mas_equalTo(0);
            make.top.mas_equalTo(_cycleScrollView.mas_bottom);
            make.height.mas_equalTo(30);
        }];

    }
    
    return self;
}

#pragma mark - UICollectionDelegate / Datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomePageMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomePageMenuCell class]) forIndexPath:indexPath];
    return cell;
}
@end
