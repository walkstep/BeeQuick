//
//  HomePageHeaderView.h
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/31.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageViewModel.h"
#import "HomeMenuIconsModel.h"

@protocol MenuDelegate <NSObject>

- (void)didSelectMenu:(HomeMenuIconsModel *)model;

@end

@interface HomePageHeaderView : UICollectionReusableView

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong) UICollectionView *menuCollectionView;
@property (nonatomic, strong) NSArray *urlArr;
@property (nonatomic, strong) HomePageViewModel *homePageViewModel;
@property (nonatomic, strong) RACSubject *headerViewSubject;
@property (nonatomic, weak) id<MenuDelegate> delegate;

@end
