//
//  HomePageHeaderView.h
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/31.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageHeaderView : UICollectionReusableView

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong) UICollectionView *menuCollectionView;
@property (nonatomic, strong) NSArray *urlArr;

@end
