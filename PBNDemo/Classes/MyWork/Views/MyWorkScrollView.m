//
//  MyWorkScrollView.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/17.
//  Copyright © 2020 常威. All rights reserved.
//

#import "MyWorkScrollView.h"

@implementation MyWorkScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setuping];
    }    return self;
}

- (void)setuping{
    self.myWorkModels = [[MyWorkModels alloc] init];
    self.pagingEnabled = NO;
    self.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height * 1.3);
    self.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:242.0/255.0 blue:243.0/255.0 alpha:1.0];
    _progressButton = [self progressButton1];
    _settingButton = [self settingButton1];
    _loginInLabel = [self loginInLabel1];
    _loginInButton = [self loginInButton1];
    [self addSubview:self.loginInButton];
    [self addSubview:self.loginInLabel];
    [self addSubview:self.settingButton];
    [self addSubview:self.progressButton];
}

- (UIButton *)loginInButton1{
    _loginInButton = [[UIButton alloc] initWithFrame:CGRectMake(10, self.bounds.size.height/15.0, self.bounds.size.width/2.5, 30)];
    _loginInButton.backgroundColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0];
    _loginInButton.layer.cornerRadius = 20.0;
    UILabel *loginInButtonLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width/2.5, 30)];
    loginInButtonLabel.text = self.myWorkModels.loginInStr;
    loginInButtonLabel.textColor = [UIColor whiteColor];
    loginInButtonLabel.textAlignment = NSTextAlignmentCenter;
    [_loginInButton addSubview:loginInButtonLabel];
    return _loginInButton;
}

- (UILabel *)loginInLabel1{
    _loginInLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.bounds.size.height/15.0 + 35, self.bounds.size.width/2.5, 10)];
    _loginInLabel.font = [UIFont systemFontOfSize:12];
    _loginInLabel.textAlignment = NSTextAlignmentCenter;
    _loginInLabel.textColor = [UIColor blackColor];
    _loginInLabel.text = _myWorkModels.loginInLabelstr;
    return _loginInLabel;
}

- (UIButton *)settingButton1{
    _settingButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width - 30, 10, 20, 20)];
    UIImageView *settingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    settingImageView.image = [UIImage imageNamed:_myWorkModels.settingImageName];
    [_settingButton addSubview:settingImageView];
    return _settingButton;
}

- (UIButton *)progressButton1{
    _progressButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width - 80, 40, 60, 60)];
    UIImageView *progressImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    progressImageView.image = [UIImage imageNamed:_myWorkModels.progressImageName];
    [_progressButton addSubview:progressImageView];
    return _progressButton;
}

@end
