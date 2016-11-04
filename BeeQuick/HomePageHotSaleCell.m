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
        self.contentView.backgroundColor = COLOR_WITH_HEX(kColorWhite);
        
        /* ----------------创建UI----------------- */
        imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [nameLabel setFont:[UIFont systemFontOfSize:14.0f]];
        
        isSelectButton = [[UIButton alloc] initWithFrame:CGRectZero];
        
        isPresentButton = [[UIButton alloc] initWithFrame:CGRectZero];
        isPresentButton.hidden = YES;
        
        specificsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [specificsLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [specificsLabel setTextColor:[UIColor grayColor]];
        
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
            make.height.mas_equalTo(180);
        }];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(imgView.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(-5);
        }];
        
        [isSelectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(nameLabel.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(nameLabel.mas_left);
            make.size.mas_equalTo(CGSizeMake(35, 15));
        }];
        
        [isPresentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(isSelectButton.mas_top);
            make.left.mas_equalTo(isSelectButton.mas_right).mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(50, 15));
        }];
        
        [specificsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(isSelectButton.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(nameLabel.mas_left);
            make.right.mas_equalTo(nameLabel.mas_right);
        }];
        
        [currentPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(specificsLabel.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(nameLabel.mas_left);
        }];
        
        [originalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(currentPriceLabel.mas_top);
            make.left.mas_equalTo(currentPriceLabel.mas_right).mas_equalTo(5);
        }];
        
        [addCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    }
    return self;
}

- (void)updateCellWithModel:(HomeHotSaleModel *)model {
    [imgView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    nameLabel.text = model.name;
    
    [isSelectButton setTitle:@"精 选" forState:UIControlStateNormal];
    [isSelectButton.titleLabel setFont:[UIFont systemFontOfSize:9.0f]];
    [isSelectButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    isSelectButton.layer.cornerRadius = 7.5f;
    isSelectButton.layer.borderWidth = 1.0f;
    isSelectButton.layer.borderColor = [UIColor redColor].CGColor;
    isSelectButton.clipsToBounds = YES;
    
    if (![model.pm_desc isEqualToString:@""]) {
        isPresentButton.hidden = NO;
        [isPresentButton setTitle:model.pm_desc forState:UIControlStateNormal];
        [isPresentButton.titleLabel setFont:[UIFont systemFontOfSize:9.0f]];
        [isPresentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [isPresentButton setBackgroundColor:[UIColor redColor]];
        isPresentButton.layer.cornerRadius = 7.5f;
        isPresentButton.clipsToBounds = YES;
    }
    
    specificsLabel.text = model.specifics;
    
    currentPriceLabel.text = [NSString stringWithFormat:@"￥%@", model.partner_price];
    [currentPriceLabel setFont:[UIFont systemFontOfSize:13.5f]];
    [currentPriceLabel setTextColor:[UIColor redColor]];
    
    originalPriceLabel.text = model.market_price;
    [originalPriceLabel setFont:[UIFont systemFontOfSize:13.5f]];
    [originalPriceLabel setTextColor:[UIColor grayColor]];
    
    //中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:originalPriceLabel.text attributes:attribtDic];
    
    // 赋值
    originalPriceLabel.attributedText = attribtStr;
}

@end
