//
//  HomePageViewModel.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/31.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "HomePageViewModel.h"

#import "ResponseModel.h"
#import "HomeHeadDataModel.h"
#import "HomeFocusModel.h"
#import "HomeActivitiesModel.h"
#import "HomeMenuIconsModel.h"
#import "HomeHotSaleModel.h"

@interface HomePageViewModel ()

{
    NSMutableArray *homeFocusArr;           // 轮播图数据
    NSMutableArray *homeActivitiesArr;      // 活动数据
    NSMutableArray *homeMenuIconsArr;       // menu数据
    NSMutableArray *homeHotSaleArr;         // 热卖数据
    NSArray *saleData;
}

@end

@implementation HomePageViewModel

- (instancetype)init {
    if (self = [super init]) {
        homeFocusArr = [[NSMutableArray alloc] init];
        homeActivitiesArr = [[NSMutableArray alloc] init];
        homeMenuIconsArr = [[NSMutableArray alloc] init];
        homeHotSaleArr = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)getHomeFocusArr {
    return homeFocusArr;
}

- (NSArray *)getHomeActivitiesArr {
    return homeActivitiesArr;
}

- (NSArray *)getHomeMenuIconsArr {
    return homeMenuIconsArr;
}

- (NSArray *)getHomeHotSaleArr {
    return homeHotSaleArr;
}

- (NSInteger)numberOfSaleDataSections {
    return saleData.count;
}

- (NSInteger)numberOfSaleDataItems:(NSInteger)section {
    NSArray *arr = [saleData objectAtIndex:section];
    return arr.count;
}

- (HomeActivitiesModel *)activityAtIndexPath:(NSIndexPath *)indexPath {
    return [homeActivitiesArr objectAtIndex:indexPath.row];
}

- (HomeHotSaleModel *)hotSaleAtIndexPath:(NSIndexPath *)indexPath {
    return [homeHotSaleArr objectAtIndex:indexPath.row];
}

/**
 *  获取轮播图url
 */
- (NSArray *)getFocusUrlArr {
    
    NSMutableArray *focusUrlArr = [[NSMutableArray alloc] init];
    for (HomeFocusModel *model in homeFocusArr) {
        [focusUrlArr addObject:model.img];
    }
    
    return focusUrlArr;
}

/**
 *  获取轮播图详情页面url
 */
- (NSArray *)getFocusDetailUrlArr {
    NSMutableArray *focusDetailsUrlArr = [[NSMutableArray alloc] init];
    for (HomeFocusModel *model in homeFocusArr) {
        [focusDetailsUrlArr addObject:model.url];
    }
    return focusDetailsUrlArr;
}

/**
 *  解析首页数据
 */
- (RACSignal *)getHomeData {
    
    return [[CommonDataManager analyzeDataWithFile:@"HomeFocus"] doNext:^(ResponseModel *response) {
        HomeHeadDataModel *homeHeadDataModel = [HomeHeadDataModel yy_modelWithDictionary:response.data];
        
        for (HomeFocusModel *model in homeHeadDataModel.focus) {
            [homeFocusArr addObject:model];
        }
        
        for (HomeActivitiesModel *model in homeHeadDataModel.activities) {
            [homeActivitiesArr addObject:model];
        }
        
        for (HomeMenuIconsModel *model in homeHeadDataModel.icons) {
            [homeMenuIconsArr addObject:model];
        }
        
        for (HomeHotSaleModel *model in homeHeadDataModel.hot) {
            [homeHotSaleArr addObject:model];
        }
        
        saleData = @[homeActivitiesArr, homeHotSaleArr];
    }];
}

@end
