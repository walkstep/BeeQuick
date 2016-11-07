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
    UIButton *reduceButton;         // 商品购物车数量减一
    UILabel *goodsCountLabel;       // 商品数量控件
    NSInteger goodsCount;           // 商品数量
    
    HomeHotSaleModel *hotSaleMode;
}

@end

@implementation HomePageHotSaleCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.contentView.backgroundColor = COLOR_WITH_HEX(kColorWhite);
        goodsCount = 0;
        
        /* ----------------创建UI----------------- */
        imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        nameLabel = [UISetupHelper setupLabelWithTitle:@"" titleColor:COLOR_WITH_HEX(kColorFontBlack) fontSize:14.0f];
        
        isSelectButton = [UISetupHelper setupButtonWithTitle:@"精选" titleColor:COLOR_WITH_HEX(kColorRed) fontSize:9.0f radius:7.5f borderWidth:1.0f borderColor:[UIColor redColor]];
        
        isPresentButton = [UISetupHelper setupButtonWithTitle:@"" titleColor:COLOR_WITH_HEX(kColorWhite) fontSize:9.0f radius:7.5f borderWidth:0 borderColor:nil];
        [isPresentButton setBackgroundColor:COLOR_WITH_HEX(kColorRed)];
        isPresentButton.hidden = YES;
        
        specificsLabel = [UISetupHelper setupLabelWithTitle:@"" titleColor:COLOR_WITH_HEX(kColorGray) fontSize:12.0f];
        
        currentPriceLabel = [UISetupHelper setupLabelWithTitle:@"" titleColor:COLOR_WITH_HEX(kColorRed) fontSize:13.5f];
        
        originalPriceLabel = [UISetupHelper setupLabelWithTitle:@"" titleColor:COLOR_WITH_HEX(kColorGray) fontSize:13.5f];
        
        addCartButton = [UISetupHelper setupButtonWithNormalImage:[UIImage imageNamed:@"btn_increase"] selectedImage:[UIImage imageNamed:@"btn_increased"]];
        
        reduceButton = [UISetupHelper setupButtonWithNormalImage:[UIImage imageNamed:@"btn_reduce"] selectedImage:[UIImage imageNamed:@"btn_reduced"]];
        reduceButton.hidden = YES;
        
        goodsCountLabel = [UISetupHelper setupLabelWithTitle:@"" titleColor:COLOR_WITH_HEX(kColorFontBlack) fontSize:13.5f];
        goodsCountLabel.textAlignment = NSTextAlignmentCenter;
        goodsCountLabel.hidden = YES;
        
        [self.contentView addSubview:imgView];
        [self.contentView addSubview:nameLabel];
        [self.contentView addSubview:isSelectButton];
        [self.contentView addSubview:isPresentButton];
        [self.contentView addSubview:specificsLabel];
        [self.contentView addSubview:currentPriceLabel];
        [self.contentView addSubview:originalPriceLabel];
        [self.contentView addSubview:addCartButton];
        [self.contentView addSubview:goodsCountLabel];
        [self.contentView addSubview:reduceButton];
        
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
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        [goodsCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.mas_equalTo(addCartButton);
            make.right.mas_equalTo(addCartButton.mas_left).mas_equalTo(5);
            make.width.mas_equalTo(30);
        }];
        
        [reduceButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(addCartButton);
            make.right.mas_equalTo(goodsCountLabel.mas_left).mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        /* ----------------------监听------------------------- */
        
        [[addCartButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            goodsCount++;
            
            if (hotSaleMode.number != 0) {
                if (hotSaleMode.number < goodsCount) {
                    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"系统提示" andMessage:@"库存不足哦，先买这么多吧"];
                    [alertView addButtonWithTitle:@"确定" type:SIAlertViewButtonTypeDefault handler:^(SIAlertView *alertView) {
    
                    }];
                    [alertView show];
                    goodsCount = goodsCount - 1;
                }
                addCartButton.selected = YES;
                reduceButton.selected = YES;
                reduceButton.hidden = NO;
                goodsCountLabel.hidden = NO;
                [goodsCountLabel setText:[NSString stringWithFormat:@"%ld", goodsCount]];
                
            } else {
                SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"系统提示" andMessage:@"库存不足哦"];
                [alertView addButtonWithTitle:@"确定" type:SIAlertViewButtonTypeDefault handler:^(SIAlertView *alertView) {
                    
                }];
                [alertView show];
            }
            
            
        }];
        
        [[reduceButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            goodsCount--;
            [goodsCountLabel setText:[NSString stringWithFormat:@"%ld", goodsCount]];
            if (goodsCount == 0) {
                goodsCountLabel.hidden = YES;
                addCartButton.selected = NO;
                reduceButton.selected = NO;
                reduceButton.hidden = YES;
            }
        }];
        
    }
    return self;
}

- (void)updateCellWithModel:(HomeHotSaleModel *)model {
    hotSaleMode = model;
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    nameLabel.text = model.name;
    
    if (![model.pm_desc isEqualToString:@""]) {
        [isPresentButton setTitle:model.pm_desc forState:UIControlStateNormal];
        isPresentButton.hidden = NO;
    }
    
    specificsLabel.text = model.specifics;
    
    currentPriceLabel.text = [NSString stringWithFormat:@"￥%@", model.partner_price];
    
    originalPriceLabel.text = model.market_price;
    
    //中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:originalPriceLabel.text attributes:attribtDic];
    
    // 赋值
    originalPriceLabel.attributedText = attribtStr;
    
    
    
    
}

@end
