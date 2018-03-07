//
//  UtilsMacro.h
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/28.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h

// 屏幕宽高
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

// 16进制转RGB
#define COLOR_WITH_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]

#endif /* UtilsMacro_h */
