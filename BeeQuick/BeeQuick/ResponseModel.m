//
//  ResponseModel.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/11/1.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "ResponseModel.h"

@implementation ResponseModel

/**
 *  数据请求是否成功
 *
 *  @return BOOL
 */
- (BOOL)isSuccess {
    return self.code;
}

@end
