//
//  ResponseModel.h
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/11/1.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseModel : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *reqid;
@property (nonatomic, strong) NSDictionary *data;

/**
 *  数据请求是否成功
 *
 *  @return BOOL
 */
- (BOOL)isSuccess;

@end
