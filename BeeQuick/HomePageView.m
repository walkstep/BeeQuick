//
//  HomePageView.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/28.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "HomePageView.h"

@implementation HomePageView

- (instancetype)init {
    if (self = [super init]) {
        // 创建UI
        self.myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero];
        self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
    }
    return self;
}

@end
