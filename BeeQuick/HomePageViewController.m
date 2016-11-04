//
//  HomePageViewController.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/27.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "HomePageViewController.h"

#import "HomePageHeaderView.h"
#import "HomePageActivityCell.h"
#import "HomePageHotSaleCell.h"

#import "ResponseModel.h"
#import "HomeHeadDataModel.h"
#import "HomeFocusModel.h"
#import "HomePageViewModel.h"
#import "HomeHotSaleModel.h"

#import "ScrollDetailsViewController.h"

@interface HomePageViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SDCycleScrollViewDelegate, MenuDelegate>

{
    UIButton *leftButton;
    UIButton *rightButton;
    UICollectionView *myCollectionView;
    HomePageViewModel *viewModel;
    BOOL isAnimation;
    CGFloat lastContentOffsetY;         //记录滑动的位置
}

@end

@implementation HomePageViewController

- (BOOL)hidesBottomBarWhenPushed {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];
    [self bindingViewModel];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = COLOR_WITH_HEX(kColorNavigationYellow);
}

- (void)initData {
    viewModel = [[HomePageViewModel alloc] init];
    isAnimation = NO;
    lastContentOffsetY = 0;
}

- (void)initView {
    self.title = @"首页";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 导航栏按钮
    leftButton = [UISetupHelper setupButtonWithTitle:@"扫一扫"
                                          titleColor:COLOR_WITH_HEX(kColorFontBlack)
                                            fontSize:10.0f
                                         normalImage:[UIImage imageNamed:@"barbuttonitem_scancode"]
                                     titleEdgeInsets:UIEdgeInsetsMake(22, -25, 0, 0)
                                     imageEdgeInsets:UIEdgeInsetsMake(-12, 4, 0, 0)];
    
    leftButton.frame = CGRectMake(0, 0, 40, 40);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    rightButton = [UISetupHelper setupButtonWithTitle:@"搜索"
                                           titleColor:COLOR_WITH_HEX(kColorFontBlack)
                                             fontSize:10.0f
                                          normalImage:[UIImage imageNamed:@"barbuttonitem_search"]
                                      titleEdgeInsets:UIEdgeInsetsMake(22, -12, 0, 0)
                                      imageEdgeInsets:UIEdgeInsetsMake(-12, 15, 0, 0)];
    rightButton.frame = CGRectMake(0, 0, 40, 40);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    myCollectionView.backgroundColor = COLOR_WITH_HEX(kColorBackgroundGray);
    myCollectionView.delegate = self;
    myCollectionView.dataSource = self;
    
    // 注册自定义headerView
    [myCollectionView registerClass:[HomePageHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([HomePageHeaderView class])];
    
    [myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([UICollectionReusableView class])];
    
    // 注册cell
    [myCollectionView registerClass:[HomePageActivityCell class] forCellWithReuseIdentifier:NSStringFromClass([HomePageActivityCell class])];
    
    [self.view addSubview:myCollectionView];
    
    // 约束
    [myCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
}

- (void)bindingViewModel {
    
    [[viewModel getHomeData] subscribeNext:^(id x) {
        [myCollectionView reloadData];
    }];
    
    [[leftButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"扫一扫");
    }];
    
    [[rightButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"搜索");
    }];
}

#pragma mark - UICollecitonViewDelegate / DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [viewModel numberOfSaleDataSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [viewModel numberOfSaleDataItems:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomePageActivityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomePageActivityCell class]) forIndexPath:indexPath];
        
        HomeActivitiesModel *model = [viewModel activityAtIndexPath:indexPath];
        [cell updateCellWithModel:model];
        
        return cell;
    } else if (indexPath.section == 1) {
        
        // 防止cell复用数据混乱
        NSString *cellID = [NSString stringWithFormat:@"cellID%ld%ld", indexPath.section, indexPath.row];
        [myCollectionView registerClass:[HomePageHotSaleCell class] forCellWithReuseIdentifier:cellID];
        HomePageHotSaleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
        
        HomeHotSaleModel *model = [viewModel hotSaleAtIndexPath:indexPath];
        [cell updateCellWithModel:model];
        
        return cell;
    }
    return nil;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            HomePageHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomePageHeaderView" forIndexPath:indexPath];
            headerView.urlArr = [viewModel getFocusUrlArr];
            headerView.cycleScrollView.delegate = self;
            headerView.delegate = self;                 // 点击menu时的代理
            headerView.homePageViewModel = viewModel;
            return headerView;
        }
    } else {
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            UICollectionReusableView *collectionReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([UICollectionReusableView class]) forIndexPath:indexPath];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            [label setFont:[UIFont systemFontOfSize:13.0f]];
            [label setTextColor:COLOR_WITH_HEX(kColorGray)];
            label.text = @"新鲜热卖";
            [collectionReusableView addSubview:label];
            
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(10);
                make.centerY.mas_equalTo(0);
                make.right.mas_equalTo(-10);
                make.height.mas_equalTo(30);
            }];
            
            return collectionReusableView;
        }
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        CGFloat menuCollectionHeight = [[viewModel getHomeMenuIconsArr] count] > 4 ? 180.0f : 90.0f;
        return CGSizeMake(SCREEN_WIDTH, menuCollectionHeight + sliderHeight);
    } else {
        return CGSizeMake(SCREEN_WIDTH, 30.0f);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(SCREEN_WIDTH - 20, 150);
    } else {
        return CGSizeMake((SCREEN_WIDTH - 28) / 2, 300);
    }
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 8.0f;
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 8.0f;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (isAnimation) {
        cell.transform = CGAffineTransformMakeTranslation(0, 80);
        [UIView animateWithDuration:1.0 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
    }
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    ScrollDetailsViewController *vc = [[ScrollDetailsViewController alloc] init];
    HomeFocusModel *model = [[viewModel getFocusUrlArr] objectAtIndex:index];
    vc.requestUrl = model.url;
    vc.titleStr = model.name;
    
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - MenuDelegate
- (void)didSelectMenu:(HomeMenuIconsModel *)model {
    ScrollDetailsViewController *vc = [[ScrollDetailsViewController alloc] init];
    vc.titleStr = model.name;
    vc.requestUrl = model.customURL;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - ScrollView Method
// 下滑才加动画，上滑不加动画
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > lastContentOffsetY) {
        isAnimation = YES;
    } else {
        isAnimation = NO;
    }
    
    lastContentOffsetY = scrollView.contentOffset.y;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
