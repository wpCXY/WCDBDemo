//
//  WPCDBManager.h
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/2.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPModelC.h"
@interface WPCDBManager : NSObject
#pragma mark - Life Cycle
+ (WPCDBManager *)defaultManager;
+ (void)destroy;
#pragma mark - Insert
- (BOOL)insertModelC:(WPModelC *)c;

#pragma mark - Update
- (BOOL)updateModeC:(WPModelC *)c;

#pragma mark - Delete
- (BOOL)deletModelC:(WPModelC *)c;
- (BOOL)deletModelCWithCId:(NSString *)cId;
- (BOOL)deletAllModelC;

#pragma mark - Select
- (WPModelC *)getModelWithCId:(NSString *)cId;
@end
