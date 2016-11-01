//
//  HomePageViewController.m
//  BeeQuick
//
//  Created by XiaoDou_Yangf on 2016/10/27.
//  Copyright © 2016年 xiaodou. All rights reserved.
//

#import "HomePageViewController.h"

#import "HomePageHeaderView.h"
#import "ResponseModel.h"
#import "HomeHeadDataModel.h"
#import "HomeFocusModel.h"

#import "HomePageViewModel.h"

#import "ScrollDetailsViewController.h"

#define kCellID @"CellID"

@interface HomePageViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SDCycleScrollViewDelegate>

{
    UIButton *leftButton;
    UIButton *rightButton;
    UICollectionView *myCollectionView;
    HomePageViewModel *viewModel;
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
}

- (void)initView {
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
    myCollectionView.backgroundColor = COLOR_WITH_HEX(kColorWhite);
    myCollectionView.delegate = self;
    myCollectionView.dataSource = self;
    
    // 注册自定义headerView
    [myCollectionView registerClass:[HomePageHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([HomePageHeaderView class])];
    
    // 注册cell
    [myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellID];
    
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
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor brownColor];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HomePageHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomePageHeaderView" forIndexPath:indexPath];
        headerView.urlArr = [viewModel getFocusUrlArr];
        headerView.cycleScrollView.delegate = self;
        return headerView;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(SCREEN_WIDTH, 240);
}


#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    ScrollDetailsViewController *vc = [[ScrollDetailsViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
