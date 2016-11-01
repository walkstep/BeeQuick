//
//  CommonDataManager.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/11/1.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "CommonDataManager.h"

#import "ResponseModel.h"

@implementation CommonDataManager

/**
 *  解析本地json文件
 *
 *  @param jsonFileName json文件名
 *
 *  @return RACSignal
 */
+ (RACSignal *)analyzeDataWithFile:(NSString *)jsonFileName {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *urlStr = [[NSBundle mainBundle] pathForResource:jsonFileName ofType:nil];
        NSData *jsonData = [NSData dataWithContentsOfFile:urlStr];
        NSMutableDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        
        ResponseModel *responseModel = [ResponseModel yy_modelWithJSON:jsonDic];
        
        if ([responseModel isSuccess]) {
            [subscriber sendNext:responseModel];
            [subscriber sendCompleted];
        } else {
            LOG(@"error: %@", responseModel.msg);
        }
        return nil;
        
    }];
    return signal;
}
@end
