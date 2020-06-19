//
//  NewsViewController.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/15.
//  Copyright © 2020 常威. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (copy, nonatomic) NSArray *listArray;
@property (strong, nonatomic) HTTPNewsResult *newsResult;

@end

static NSString * const urlPBN1 = @"http://paint-api.dailyinnovation.biz/paint/v1/operation/news";
static NSString * const cellIdentifier = @"cellIdentifier";
static NSString * const headerIdentifier = @"headerIdentifier";

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AFHTTPSessionManager *manager = [self shareAFNManager];
    [manager GET:urlPBN1 parameters:nil progress:^(NSProgress * _Nonnull downloadProgress){
        NSLog(@"downloadProgress-->%@", downloadProgress);
    } success:^(NSURLSessionTask * _Nonnull task, id _Nullable responseObject){
        self.newsResult = [HTTPNewsResult yy_modelWithJSON:responseObject];
        Data *dataDict = self.newsResult.data;
        self.listArray = dataDict.newsList;
        [self.collectionView reloadData];
    } failure:^(NSURLSessionTask * _Nullable task, NSError * _Nonnull error){
        NSLog(@"error-->%@", error);
    }];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[NewsCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    [self.collectionView registerClass:[NewsCollectionReusableView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
}

//基础配置
- (AFHTTPSessionManager *)shareAFNManager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 30.0f;
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml", @"text/html", @"application/json", @"text/plain", nil];
    return manager;
}

- (UICollectionViewFlowLayout *)flowLayout{
    if(!_flowLayout){
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        CGFloat Width = self.view.bounds.size.width;
        CGFloat Height = self.view.bounds.size.height;
        _flowLayout.headerReferenceSize = CGSizeMake(Width - 10, Height/17.0);
        _flowLayout.itemSize = CGSizeMake(Width-20, Height/3.5);
        _flowLayout.minimumLineSpacing = 10;
        _flowLayout.minimumInteritemSpacing = 10;
        
        _flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView{
    if(!_collectionView){
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:242.0/255.0 blue:243.0/255.0 alpha:1.0];
        [_collectionView.layer setCornerRadius:5];
        _collectionView.pagingEnabled = NO;
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.listArray count];
}

//获得被重用的cell
- (NewsCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    if(cell == nil){
        
    }
    long rowNum = indexPath.row;
    NewsList *newsList = [self.listArray objectAtIndex:rowNum];
    NewsCollectionCellModel *model = [[NewsCollectionCellModel alloc] init];
    model.buttonText = newsList.buttonText;
    model.textTitle = newsList.title;
    model.textDesc = newsList.desc1;
    model.imageURL = newsList.figure;
    model.linkText = newsList.link;
    [cell setModel:model];
    
    [cell awakeFromNib];
//    NSLog(@"----%@", cell.labelTitle.text);
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NewsCollectionReusableView *reusableView;
    reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
    reusableView.label.textAlignment = NSTextAlignmentLeft;
    reusableView.label.text = @"活动";
    reusableView.label.font = [UIFont systemFontOfSize:20];
    return reusableView;
}

//设置items大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(self.view.bounds.size.width-20, self.view.bounds.size.width/3.5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.view.bounds.size.width - 10, self.view.bounds.size.height/17.0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
