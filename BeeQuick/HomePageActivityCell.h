//
//  HomePageActivityCell.h
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/11/3.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HomeActivitiesModel.h"

@interface HomePageActivityCell : UICollectionViewCell

- (void)updateCellWithModel:(HomeActivitiesModel *)model;

@end
