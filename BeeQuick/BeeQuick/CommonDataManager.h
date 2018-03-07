//
//  CommonDataManager.h
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/11/1.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonDataManager : NSObject

/**
 *  解析本地json文件
 *
 *  @param jsonFileName json文件名
 *
 *  @return RACSignal
 */
+ (RACSignal *)analyzeDataWithFile:(NSString *)jsonFileName;

@end
