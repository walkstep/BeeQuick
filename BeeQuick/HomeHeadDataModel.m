//
//  HomeHeadDataModel.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/11/1.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "HomeHeadDataModel.h"
#import "HomeActivitiesModel.h"
#import "HomeFocusModel.h"
#import "HomeMenuIconsModel.h"

@implementation HomeHeadDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"activities" : [HomeActivitiesModel class],
             @"focus" : [HomeFocusModel class],
             @"icons" : [HomeMenuIconsModel class]};
}

@end
