//
//  SettingModel.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/18.
//  Copyright © 2020 常威. All rights reserved.
//

#import "SettingModel.h"

@implementation SettingModel

- (instancetype)init{
    self = [super init];
    if(self){
        SettingBaseModel *base11 = [[SettingBaseModel alloc] init];
        base11.photoName = @"Shading Effect";
        base11.str = @"提示色";
        SettingBaseModel *base12 = [[SettingBaseModel alloc] init];
        base12.photoName = @"Hide Colored";
        base12.str = @"隐藏成就完成弹框";
        SettingBaseModel *base13 = [[SettingBaseModel alloc] init];
        base13.photoName = @"Vibration";
        base13.str = @"涂色震动";
        NSArray *section1 = [[NSArray alloc] initWithObjects:base11, base12, base13, nil];
        
        
        SettingBaseModel *base21 = [[SettingBaseModel alloc] init];
        base21.photoName = @"Sounds";
        base21.str = @"成为高级会员";
        SettingBaseModel *base22 = [[SettingBaseModel alloc] init];
        base22.photoName = @"icon_removeAds";
        base22.str = @"移除插屏和底部广告（不包含视频广告）";
        SettingBaseModel *base23 = [[SettingBaseModel alloc] init];
        base23.photoName = @"Restore";
        base23.str = @"恢复购买";
        SettingBaseModel *base24 = [[SettingBaseModel alloc] init];
        base24.photoName = @"icon_removeWatermark";
        base24.str = @"移除水印";
        NSArray *section2 = [[NSArray alloc] initWithObjects:base21, base22, base23, base24, nil];
        
        SettingBaseModel *base31 = [[SettingBaseModel alloc] init];
        base31.photoName = @"Rate Us";
        base31.str = @"去App Store给我们评分";
        SettingBaseModel *base32 = [[SettingBaseModel alloc] init];
        base32.photoName = @"Leave Feedback";
        base32.str = @"客服邮箱";
        SettingBaseModel *base33 = [[SettingBaseModel alloc] init];
        base33.photoName = @"Clean colored cache";
        base33.str = @"清除缓存";
        SettingBaseModel *base34 = [[SettingBaseModel alloc] init];
        base34.photoName = @"Add a shortcut to Siri";
        base34.str = @"添加Siri快捷方式以开始填色";
        NSArray *section3 = [[NSArray alloc] initWithObjects:base31, base32, base33, base34, nil];
        
        SettingBaseModel *base41 = [[SettingBaseModel alloc] init];
        base41.photoName = @"Privacy Policy";
        base41.str = @"隐私政策";
        SettingBaseModel *base42 = [[SettingBaseModel alloc] init];
        base42.photoName = @"Terms of Service";
        base42.str = @"服务协议";
        NSArray *section4 = [[NSArray alloc] initWithObjects:base41, base42, nil];
        
        _model = [[NSArray alloc] initWithObjects:section1, section2, section3, section4, nil];
    }
    return self;
}


@end
