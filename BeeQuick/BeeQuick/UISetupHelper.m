//
//  UISetupHelper.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/28.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "UISetupHelper.h"

@implementation UISetupHelper

/**
 *  创建带有标题和图片偏移的按钮
 *
 *  @param tilte           标题
 *  @param titleColor      标题颜色
 *  @param fontSize        标题字体大小
 *  @param normalImage     普通状态图片
 *  @param titleEdgeInsets 标题偏移
 *  @param imageEdgeInsets 图片偏移
 *
 *  @return UIButton
 */
+ (UIButton *)setupButtonWithTitle:(NSString *)title
                  titleColor:(UIColor *)titleColor
                    fontSize:(CGFloat)fontSize
                 normalImage:(UIImage *)normalImage
             titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
             imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [button setImage:normalImage forState:UIControlStateNormal];
    button.titleEdgeInsets = titleEdgeInsets;
    button.imageEdgeInsets = imageEdgeInsets;
    
    return button;
}

/**
 *  创建带有标题和图片的按钮，有高亮图片，可以切圆
 *
 *  @param title       标题
 *  @param titleColor  标题颜色
 *  @param fontSize    标题字体大小
 *  @param normalImage 普通状态图片
 *  @param highImage   高亮状态图片
 *  @param radius      半径
 *  @param borderColor border颜色
 *
 *  @return UIButton
 */
+ (UIButton *)setupButtonWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
                          fontSize:(CGFloat)fontSize
                       normalImage:(UIImage *)normalImage
                         highImage:(UIImage *)highImage
                            radius:(CGFloat)radius
                       borderColor:(UIColor *)cgColor {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highImage forState:UIControlStateHighlighted];
    [button.layer setCornerRadius:radius];
    button.layer.borderColor = cgColor.CGColor;
    
    return button;
}

/**
 *  创建带有切圆功能的按钮
 *
 *  @param title       标题
 *  @param titleColor  标题颜色
 *  @param fontSize    标题字体大小
 *  @param radius      半径
 *  @param borderWidth border宽度
 *  @param cgColor     border颜色
 *
 *  @return UIButton
 */
+ (UIButton *)setupButtonWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
                          fontSize:(CGFloat)fontSize
                            radius:(CGFloat)radius
                       borderWidth:(CGFloat)borderWidth
                       borderColor:(UIColor *)cgColor {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [button.layer setCornerRadius:radius];
    button.layer.borderWidth = borderWidth;
    button.layer.borderColor = cgColor.CGColor;
    button.clipsToBounds = YES;
    
    return button;
}

/**
 *  创建带有选中效果的图片按钮
 *
 *  @param normalImage   普通状态图片
 *  @param selectedImage 选中状体图片
 *
 *  @return UIButton
 */
+ (UIButton *)setupButtonWithNormalImage:(UIImage *)normalImage
                           selectedImage:(UIImage *)selectedImage {
    UIButton *button = [[UIButton alloc] init];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    
    return button;
}

/**
 *  创建基本Label
 *
 *  @param title      标题
 *  @param titleColor 标题颜色
 *  @param fontSize   标题字体大小
 *
 *  @return UILabel
 */
+ (UILabel *)setupLabelWithTitle:(NSString *)title
                      titleColor:(UIColor *)titleColor
                        fontSize:(CGFloat)fontSize {
    UILabel *label = [[UILabel alloc] init];
    [label setText:title];
    [label setTextColor:titleColor];
    [label setFont:[UIFont systemFontOfSize:fontSize]];
    
    return label;
}
@end
