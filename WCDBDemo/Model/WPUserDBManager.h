//
//  WPUserDBManager.h
//  WCDBDemo
//
//  Created by 王鹏 on 2017/7/26.
//  Copyright © 2017年 王鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPUserModel.h"

@interface WPUserDBManager : NSObject

#pragma mark - Life Cycle
+ (WPUserDBManager *)defaultManager;
+ (void)destroy;

#pragma mark - Insert
- (BOOL)insertUser:(WPUserModel *)user;

#pragma mark - Update
- (BOOL)updateUser:(WPUserModel *)user;

#pragma mark - Delete
- (BOOL)deletUser:(WPUserModel *)user;
- (BOOL)deletAllUsers;
- (BOOL)deletUsersWithAge:(NSInteger)age;

#pragma mark - Select
- (WPUserModel *)getUserWithUserID:(NSString *)userID;
- (NSArray *)getUsersWithAge:(NSInteger)age;
- (NSArray *)getAllUserByAgeASC;
- (NSArray *)getAllUser;

@end
