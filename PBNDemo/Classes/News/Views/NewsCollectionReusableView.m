//
//  NewsCollectionReusableView.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/16.
//  Copyright © 2020 常威. All rights reserved.
//

#import "NewsCollectionReusableView.h"

@implementation NewsCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.bounds.size.width/5.0, self.bounds.size.height-15)];
        _label.textColor = [UIColor blackColor];
        [self addSubview:_label];
    }
    return self;
}

@end
