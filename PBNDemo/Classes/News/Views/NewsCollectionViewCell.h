//
//  NewsCollectionViewCell.h
//  PBNDemo
//
//  Created by 常威 on 2020/6/15.
//  Copyright © 2020 常威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsCollectionCellModel.h"
#import <UIImageView+WebCache.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) NewsCollectionCellModel *model;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *labelTitle;
@property (strong, nonatomic) UILabel *labelText;

@end

NS_ASSUME_NONNULL_END
