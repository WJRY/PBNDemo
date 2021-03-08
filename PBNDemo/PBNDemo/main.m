//
//  main.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/15.
//  Copyright © 2020 常威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        // 当前文件下后缀为 data 的文件
//        NSFileManager *manager = [NSFileManager defaultManager];
//        NSString *home = [@"~" stringByExpandingTildeInPath];
//        NSDirectoryEnumerator *direnum = [manager enumeratorAtPath:home];
//        NSMutableArray *files = [NSMutableArray arrayWithCapacity:42];
//        NSString *filename = nil;
//        while (filename = [direnum nextObject]) {
//            if ([[filename pathExtension] isEqualToString:@"data"]) {
//                [files addObject:filename];
//            }
//        }
//        NSEnumerator *fileenum = [files objectEnumerator];
//        while (filename = [fileenum nextObject]) {
//            NSLog(@"%@%@", home, filename);
//        }
        NSFileManager *manager = [NSFileManager defaultManager];
        NSString *home = [@"~" stringByExpandingTildeInPath];
        NSMutableArray *files = [NSMutableArray arrayWithCapacity:42];
        
        for (NSString *filename in [manager enumeratorAtPath:home]) {
            if ([[filename pathExtension] isEqualToString:@"data"]) {
                [files addObject:filename];
            }
        }
        for (NSString *filename in files) {
            NSLog(@"%@%@", home, filename);
        }
        
        
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
