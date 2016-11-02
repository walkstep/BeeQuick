//
//  HomePageMenuCell.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/31.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "HomePageMenuCell.h"

@interface HomePageMenuCell ()

{
    UIButton *button;
    UILabel *label;
}

@end

@implementation HomePageMenuCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self.contentView.backgroundColor = COLOR_WITH_HEX(kColorWhite);
    
    self = [super initWithFrame:frame];
    if (self) {
        /* -----------UI控件---------- */
        button = [[UIButton alloc] init];
        
        label = [[UILabel alloc] init];
        [label setFont:[UIFont systemFontOfSize:13.0f]];
        label.textAlignment = NSTextAlignmentCenter;
        
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

- (void)updateCellWithModel:(HomeMenuIconsModel *)model {
    NSURL *url = [NSURL URLWithString:model.img];
//    [button sd_setBackgroundImageWithURL:url forState:UIControlStateNormal];
    [button sd_setImageWithURL:url forState:UIControlStateNormal];
    [button.imageView setContentMode:UIViewContentModeScaleAspectFit];
    label.text = model.name;
}

@end
