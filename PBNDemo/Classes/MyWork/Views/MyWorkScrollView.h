//
//  MyWorkScrollView.h
//  PBNDemo
//
//  Created by 常威 on 2020/6/17.
//  Copyright © 2020 常威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyWorkModels.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyWorkScrollView : UIScrollView

@property (strong, nonatomic) MyWorkModels *myWorkModels;
@property (strong, nonatomic) UIButton *loginInButton;
@property (strong, nonatomic) UIButton *settingButton;
@property (strong, nonatomic) UIButton *progressButton;
@property (strong, nonatomic) UILabel *loginInLabel;

@end

NS_ASSUME_NONNULL_END
