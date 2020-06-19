//
//  NewsCollectionCellModel.h
//  PBNDemo
//
//  Created by 常威 on 2020/6/15.
//  Copyright © 2020 常威. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsCollectionCellModel : NSObject

//模型数据
@property (copy, nonatomic) NSString *imageURL;
@property (copy, nonatomic) NSString *textTitle;
@property (copy, nonatomic) NSString *textDesc;
@property (copy, nonatomic) NSString *buttonText;
@property (copy, nonatomic) NSString *linkText;


@end

NS_ASSUME_NONNULL_END
