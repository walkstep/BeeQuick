//
//  HomePageViewModel.h
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/31.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomePageViewModel : BaseViewModel

- (NSArray *)getHomeFocusArr;

- (NSArray *)getHomeActivitiesArr;

- (NSArray *)getHomeMenuIconsArr;

/**
 *  获取轮播图url
 */
- (NSArray *)getFocusUrlArr;

/**
 *  获取轮播图详情页面url
 */
- (NSArray *)getFocusDetailUrlArr;

/**
 *  解析首页数据
 */
- (RACSignal *)getHomeData;

@end
