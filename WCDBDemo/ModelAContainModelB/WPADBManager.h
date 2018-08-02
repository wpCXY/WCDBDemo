//
//  WPADBManager.h
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/1.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPModelA.h"
#import "WPModelB.h"
@interface WPADBManager : NSObject
#pragma mark - Life Cycle
+ (WPADBManager *)defaultManager;
+ (void)destroy;
#pragma mark - Insert
- (BOOL)insertModelA:(WPModelA *)a;

#pragma mark - Update
- (BOOL)updateModeA:(WPModelA *)a;

#pragma mark - Delete
- (BOOL)deletModelA:(WPModelA *)a;
- (bool)deletModelAWithAId:(NSString *)AId;
- (BOOL)deletAllModelA;

#pragma mark - Select
- (WPModelA *)getModelAWithAId:(NSString *)aId;
@end
