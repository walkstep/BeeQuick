//
//  HomePageMenuCell.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/31.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "HomePageMenuCell.h"

@implementation HomePageMenuCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        /* -----------UI控件---------- */
        UIButton *button = [[UIButton alloc] init];
        
        UILabel *label = [[UILabel alloc] init];
        
        [self.contentView addSubview:button];
        [self.contentView addSubview:label];
        
        /* -----------约束------------ */
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.mas_equalTo(0);
            make.top.mas_equalTo(button.mas_bottom);
            make.bottom.mas_equalTo(0);
        }];
    }
    return self;
}

@end
