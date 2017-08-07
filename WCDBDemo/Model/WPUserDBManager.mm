//
//  WPUserDBManager.m
//  WCDBDemo
//
//  Created by 王鹏 on 2017/7/26.
//  Copyright © 2017年 王鹏. All rights reserved.
//

#import "WPUserDBManager.h"
#import "WPUserModel+WCTTableCoding.h"

static WPUserDBManager *instance = nil;
static NSString *const UserTable = @"user";
@interface WPUserDBManager ()

@property (nonatomic, strong) WCTDatabase *dataBase;
@property (nonatomic, strong) WCTTable    *table;

@end

@implementation WPUserDBManager

#pragma mark - Life Cycle
+ (WPUserDBManager *)defaultManager {
    if (instance) {
        return instance;
    }
    @synchronized (self) {
        if (instance == nil) {
            instance = [[WPUserDBManager alloc] init];
            [instance creatUserDB];
        }
    }
    return instance;
}
+ (void)destroy {
    instance = nil;
}

#pragma mark - Creat UserDB
- (BOOL)creatUserDB {
    NSString *databasePath = [self getDBPath];
    NSLog(@"DBPath:%@",databasePath);
    _dataBase = [[WCTDatabase alloc] initWithPath:databasePath];
    _table = [_dataBase getTableOfName:UserTable
                             withClass:WPUserModel.class];
    BOOL result = [_dataBase createTableAndIndexesOfName:UserTable
                                               withClass:WPUserModel.class];
    if (result) {
        NSLog(@"User Table Creat Success!");
        return YES;
    } else {
        NSLog(@"User Table Creat Fail!");
        return NO;
    }

}
- (NSString *)getDBPath {
    NSString *databasePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/database/userID"];
       databasePath = [databasePath stringByAppendingPathComponent:@"user.db"];
    return databasePath;
}
#pragma mark - Insert
- (BOOL)insertUser:(WPUserModel *)user {
//    return [_table insertOrReplaceObject:user];
    return [_table insertObject:user];
}

#pragma mark - Update
- (BOOL)updateUser:(WPUserModel *)user {
    return [_table updateRowsOnProperties:WPUserModel.AllProperties
                               withObject:user
                                    where:WPUserModel.userID == user.userID];
}

#pragma mark - Delete
- (BOOL)deletUser:(WPUserModel *)user {
    return [_table deleteObjectsWhere:WPUserModel.userID == user.userID];
}
- (BOOL)deletAllUsers {
    return [_table deleteAllObjects];
}
- (BOOL)deletUsersWithAge:(NSInteger)age {
    return [_table deleteObjectsWhere:WPUserModel.age == age];
}

#pragma mark - Select
- (WPUserModel *)getUserWithUserID:(NSString *)userID {
    return [_table getObjectsWhere:WPUserModel.userID == userID].firstObject;
}
- (NSArray *)getUsersWithAge:(NSInteger)age {
    return [_table getObjectsWhere:WPUserModel.age == age];
}
- (NSArray *)getAllUserByAgeASC {
    return [_table getObjectsOrderBy:WPUserModel.age.order(WCTOrderedAscending)];
}
- (NSArray *)getAllUser {
    return [_table getAllObjects];
}


@end
