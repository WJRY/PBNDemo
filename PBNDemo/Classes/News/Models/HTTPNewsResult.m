//
//  HTTPNewsResult.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/15.
//  Copyright © 2020 常威. All rights reserved.
//

#import "HTTPNewsResult.h"

@implementation HTTPNewsResult

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{
        @"status" : [Status class],
        @"data" : [Data class]
    };
}

@end

@implementation NewsList
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{
        @"desc1" : @"description"
    };
}

@end

@implementation Data
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{
        @"newsList" : [NewsList class]
    };
}

@end

@implementation Status

@end
