//
//  SettingCollectionViewCell.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/18.
//  Copyright © 2020 常威. All rights reserved.
//

#import "SettingCollectionViewCell.h"

@implementation SettingCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 40, 40)];
        _label = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 250, 40)];
        _label.numberOfLines = 0;
        _label.lineBreakMode = NSLineBreakByWordWrapping;
//        CGFloat height = [_label.text boundingRectWithSize:CGSizeMake(_label.frame.size.width, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:_label.font, NSFontAttributeName, nil] context:nil].size.height;
//        _label.frame = CGRectMake(80, 10, 300, height);
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        
//        [self.contentView addSubview:_imageView];
//        [self.contentView addSubview:_label];
        [self.button addSubview:_imageView];
        [self.button addSubview:_label];
        [self.contentView addSubview:_button];
    }
    return self;
}

@end
