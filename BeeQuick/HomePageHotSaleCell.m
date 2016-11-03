//
//  HomePageHotSaleCell.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/11/3.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "HomePageHotSaleCell.h"

@interface HomePageHotSaleCell ()

{
    UIImageView *imgView;           // 商品图片
    UILabel *nameLabel;             // 商品名
    UIButton *isSelectButton;       // 是否是精选
    UIButton *isPresentButton;      // 是否买一送一
    UILabel *specificsLabel;        // 质量
    UILabel *currentPriceLabel;     // 现价
    UILabel *originalPriceLabel;    // 原价
    UIButton *addCartButton;        // 加入购物车
}

@end

@implementation HomePageHotSaleCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        /* ----------------创建UI----------------- */
        imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        isSelectButton = [[UIButton alloc] initWithFrame:CGRectZero];
        
        isPresentButton = [[UIButton alloc] initWithFrame:CGRectZero];
        
        specificsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        currentPriceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        originalPriceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        addCartButton = [[UIButton alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:imgView];
        [self.contentView addSubview:nameLabel];
        [self.contentView addSubview:isSelectButton];
        [self.contentView addSubview:isPresentButton];
        [self.contentView addSubview:specificsLabel];
        [self.contentView addSubview:currentPriceLabel];
        [self.contentView addSubview:originalPriceLabel];
        [self.contentView addSubview:addCartButton];
        
        /* ----------------约束----------------- */
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.mas_equalTo(0);
            make.height.mas_equalTo(100);
        }];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(imgView.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(-5);
        }];
        
        [isSelectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(nameLabel.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(nameLabel.mas_left);
            make.size.mas_equalTo(CGSizeMake(30, 15));
        }];
        
        [isPresentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(isSelectButton.mas_top);
            make.left.mas_equalTo(isSelectButton.mas_right).mas_equalTo(5);
            make.size.mas_equalTo(isSelectButton.mas_height);
            make.size.mas_equalTo(isSelectButton.mas_width);
        }];
        
        [specificsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(isSelectButton.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(nameLabel.mas_left);
            make.right.mas_equalTo(nameLabel.mas_right);
        }];
        
        [currentPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(specificsLabel.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(nameLabel.mas_left);
            make.right.mas_equalTo(nameLabel.mas_right);
        }];
        
        [originalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(currentPriceLabel.mas_top);
            make.left.mas_equalTo(currentPriceLabel.mas_right).mas_equalTo(5);
            make.width.mas_equalTo(50);
        }];
        
        [addCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    }
    return self;
}

@end
