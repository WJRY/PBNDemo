//
//  MyWorkModels.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/18.
//  Copyright © 2020 常威. All rights reserved.
//

#import "MyWorkModels.h"

@implementation MyWorkModels

- (instancetype)init{
    self = [super init];
    if(self){
        self.loginInStr = @"登录以同步数据";
        self.loginInLabelstr = @"登录后，你的数据不会丢失";
        self.settingImageName = @"settings";
        self.progressImageName = @"guonei_myworks";
    }
    return self;
}

@end
