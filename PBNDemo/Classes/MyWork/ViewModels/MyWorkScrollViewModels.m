//
//  MyWorkScrollViewModels.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/18.
//  Copyright © 2020 常威. All rights reserved.
//

#import "MyWorkScrollViewModels.h"

@implementation MyWorkScrollViewModels

- (instancetype)init{
    self = [super init];
    if(self){
        [self myWorkModels];
        [self myWorkScrollView];
        UILabel *loginInButtonLabel = [[UILabel alloc] init];
        loginInButtonLabel.text = self.myWorkModels.loginInStr;
        [_myWorkScrollView.loginInButton addSubview:loginInButtonLabel];      _myWorkScrollView.loginInLabel.text = _myWorkModels.loginInLabelstr;

        _myWorkScrollView.settingButton.imageView.image = [UIImage imageNamed:_myWorkModels.settingImageName];
        _myWorkScrollView.progressButton.imageView.image = [UIImage imageNamed:_myWorkModels.progressImageName];
    }
    return self;
}

//设置scrollView
- (MyWorkScrollView *)myWorkScrollView{
    _myWorkScrollView = [[MyWorkScrollView alloc] init];
    return _myWorkScrollView;
}

//初始化models
- (MyWorkModels *)myWorkModels{
    _myWorkModels = [[MyWorkModels alloc] init];
    return _myWorkModels;
}

@end
