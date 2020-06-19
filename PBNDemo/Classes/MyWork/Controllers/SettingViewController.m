//
//  SettingViewController.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/18.
//  Copyright © 2020 常威. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) SettingModel *settingModel;


@end

static NSString * const cellIdentifier = @"cellIdentifier";
#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    [self setNavigationBar];
    
    self.settingModel = [[SettingModel alloc] init];
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[SettingCollectionViewCell  class] forCellWithReuseIdentifier:cellIdentifier];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setNavigationBar{
    UILabel *navigationTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 20, 5, 80, 30)];
    navigationTitleLabel.text = @"设置";
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *backButtonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    backButtonImageView.image = [UIImage imageNamed:@"icon_Back"];
    [backButton addSubview:backButtonImageView];
    [backButton addTarget:self action:@selector(backTap) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
    [self.navigationController.navigationBar addSubview:navigationTitleLabel];
}

- (UICollectionViewFlowLayout *)flowLayout{
    if(!_flowLayout){
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _flowLayout.itemSize = CGSizeMake(WIDTH, 60);
//        _flowLayout.headerReferenceSize = CGSizeMake(WIDTH-10, 35);
//        _flowLayout.footerReferenceSize = CGSizeMake(WIDTH-10, 35);
        _flowLayout.minimumLineSpacing = 1;
        _flowLayout.minimumInteritemSpacing = 1;
        
        _flowLayout.sectionInset = UIEdgeInsetsMake(10, 5, 5, 10);
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:242.0/255.0 blue:243.0/255.0 alpha:1.0];
        _collectionView.pagingEnabled = NO;
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.settingModel.model.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.settingModel.model[section] count];
}


- (SettingCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    SettingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    SettingBaseModel *baseModel = [self.settingModel.model[indexPath.section] objectAtIndex:indexPath.item];
    cell.imageView.image = [UIImage imageNamed:baseModel.photoName];
    cell.label.text = baseModel.str;
    if(indexPath.section == 1 && indexPath.item == 0){
        [cell.button addTarget:self action:@selector(purchaseTap) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}

//按钮响应事件
- (void)backTap{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)purchaseTap{
    PurchaseViewController *purchaseViewController = [[PurchaseViewController alloc] init];
    [self.navigationController pushViewController:purchaseViewController animated:YES];
}

//设置item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(WIDTH, 60);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 5, 5, 10);
}


@end
