//
//  AppMacro.h
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/28.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

#import <UIKit/UIKit.h>

#ifndef DEBUG
#define Debugger 1
#define LOG(...) NSLog(__VA_ARGS__)
#else
#define Debugger 0
#define LOG(...)
#endif

#if Debugger
// 调试模式操作
#else
// 线上模式操作
#endif

// 颜色
static NSInteger const kColorNavigationYellow = 0xFDD431;
static NSInteger const kColorFontBlack = 0x212121;
static NSInteger const kColorWhite = 0xFFFFFF;
static NSInteger const kColorGray = 0x757575;

#endif /* AppMacro_h */
