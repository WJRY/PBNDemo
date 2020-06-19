//
//  HTTPNewsResult.h
//  PBNDemo
//
//  Created by 常威 on 2020/6/15.
//  Copyright © 2020 常威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@class NewsList, Data, Status, HTTPNewsResult;


@interface NewsList : NSObject

@property (copy, nonatomic) NSNumber *id;
@property (copy, nonatomic) NSString *figure;
@property (copy, nonatomic) NSString *link;
@property (copy, nonatomic) NSString *androidURL;
@property (copy, nonatomic) NSString *iOSURl;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *desc1;
@property (copy, nonatomic) NSString *buttonText;

@end


@interface Data : NSObject

@property (strong, nonatomic) NSArray<NewsList *> *newsList;

@end


@interface Status : NSObject

@property (copy, nonatomic) NSString *message;
@property (nonatomic, assign) NSInteger code;

@end



@interface HTTPNewsResult : NSObject

@property (strong, nonatomic) Status *status;
@property (strong, nonatomic) Data *data;
@end


NS_ASSUME_NONNULL_END
