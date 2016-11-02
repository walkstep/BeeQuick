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

{
    UICollectionViewFlowLayout *layout;
    HomePageViewModel *viewModel;
}

@end

@implementation HomePageHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        // 轮播图
        _cycleScrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectZero];
        _cycleScrollView.pageDotColor = COLOR_WITH_HEX(kColorWhite);
        _cycleScrollView.currentPageDotColor = COLOR_WITH_HEX(kColorNavigationYellow);
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _cycleScrollView.autoScrollTimeInterval = 5;
        
        // 监听轮播图url数组
        [RACObserve(self, urlArr) subscribeNext:^(id x) {
            _cycleScrollView.imageURLStringsGroup = _urlArr;
        }];
        
        // 监听ViewModel
        [RACObserve(self, homePageViewModel) subscribeNext:^(id x) {
            viewModel = _homePageViewModel;
        }];
        
        // menu选项
        layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(SCREEN_WIDTH/4, 90);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        _menuCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _menuCollectionView.scrollEnabled = NO;
        _menuCollectionView.delegate = self;
        _menuCollectionView.dataSource = self;
        _menuCollectionView.backgroundColor = COLOR_WITH_HEX(kColorWhite);
        
        // 注册cell
        [_menuCollectionView registerClass:[HomePageMenuCell  class] forCellWithReuseIdentifier:NSStringFromClass([HomePageMenuCell class])];
        
        
        [self addSubview:_cycleScrollView];
        [self addSubview:_menuCollectionView];
        
        /* ----------约束---------- */
        [_cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.mas_equalTo(0);
            make.height.mas_equalTo(sliderHeight);
        }];
        
        [_menuCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.mas_equalTo(0);
            make.top.mas_equalTo(_cycleScrollView.mas_bottom);
            make.height.mas_equalTo(90);
        }];

    }
    
    return self;
}

#pragma mark - UICollectionDelegate / Datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[viewModel getHomeMenuIconsArr] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomePageMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomePageMenuCell class]) forIndexPath:indexPath];
    HomeMenuIconsModel *homeMenuIconsModel = [[viewModel getHomeMenuIconsArr] objectAtIndex:indexPath.row];
    
    [cell updateCellWithModel:homeMenuIconsModel];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

@end
