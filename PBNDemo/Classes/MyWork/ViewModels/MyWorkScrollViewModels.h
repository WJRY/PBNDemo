//
//  MyWorkScrollViewModels.h
//  PBNDemo
//
//  Created by 常威 on 2020/6/18.
//  Copyright © 2020 常威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyWorkModels.h"
#import "MyWorkScrollView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyWorkScrollViewModels : NSObject

@property (strong, nonatomic) MyWorkScrollView *myWorkScrollView;
@property (strong, nonatomic) MyWorkModels *myWorkModels;

@end

NS_ASSUME_NONNULL_END
