//
//  HomePageViewModel.h
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/31.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomePageViewModel : BaseViewModel

/**
 *  获取轮播图url
 */
- (NSArray *)getFocusUrlArr;

/**
 *  解析首页数据
 */
- (RACSignal *)getHomeData;


@end
