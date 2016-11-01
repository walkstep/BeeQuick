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

@interface HomePageViewModel ()

{
    NSMutableArray *homeFocusArr;
    NSMutableArray *homeActivitiesArr;
    NSMutableArray *homeMenuIconsArr;
    NSMutableArray *focusUrlArr;
}

@end

@implementation HomePageViewModel

- (instancetype)init {
    if (self = [super init]) {
        homeFocusArr = [[NSMutableArray alloc] init];
        homeActivitiesArr = [[NSMutableArray alloc] init];
        homeMenuIconsArr = [[NSMutableArray alloc] init];
        focusUrlArr = [[NSMutableArray alloc] init];
    }
    return self;
}

/**
 *  获取轮播图url
 */
- (NSArray *)getFocusUrlArr {
    for (HomeFocusModel *model in homeFocusArr) {
        [focusUrlArr addObject:model.img];
    }
    
    return focusUrlArr;
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
    }];
}

@end
