//
//  HomePageActivityCell.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/11/3.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "HomePageActivityCell.h"

@interface HomePageActivityCell ()

{
    UIImageView *imageView;
}

@end

@implementation HomePageActivityCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        /* ---------------------创建UI------------------------ */
        imageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:imageView];
        
        /* ---------------------约束------------------------ */
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return self;
}

- (void)updateCellWithModel:(HomeActivitiesModel *)model {
    NSURL *imgUrl = [NSURL URLWithString:model.img];
    [imageView sd_setImageWithURL:imgUrl];
}

@end
