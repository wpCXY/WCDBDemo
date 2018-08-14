//
//  WPBossDBManager.m
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/14.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import "WPBossDBManager.h"
#import "WPBossModel+WCTTableCoding.h"
static WPBossDBManager *instance = nil;
static NSString *const BoosTable = @"boss";
@interface WPBossDBManager ()
@property (nonatomic, strong) WCTDatabase *dataBase;
@property (nonatomic, strong) WCTTable    *table;
@end

@implementation WPBossDBManager
#pragma mark - Life Cycle
+ (WPBossDBManager *)defaultManager {
    if (instance) {
        return instance;
    }
    @synchronized (self) {
        if (instance == nil) {
            instance = [[WPBossDBManager alloc] init];
            [instance creatBossDB];
        }
    }
    return instance;
}
+ (void)destroy {
    instance = nil;
}
#pragma mark - Creat BossDB
- (BOOL)creatBossDB {
    NSString *databasePath = [self getDBPath];
    NSLog(@"DBPath:%@",databasePath);
    _dataBase = [[WCTDatabase alloc] initWithPath:databasePath];
    _table = [_dataBase getTableOfName:BoosTable
                             withClass:WPBossModel.class];
    BOOL result = [_dataBase createTableAndIndexesOfName:BoosTable
                                               withClass:WPBossModel.class];
    if (result) {
        NSLog(@"Boss Table Creat Success!");
        return YES;
    } else {
        NSLog(@"Boss Table Creat Fail!");
        return NO;
    }
    
}
- (NSString *)getDBPath {
    NSString *databasePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/database/boss"];
    databasePath = [databasePath stringByAppendingPathComponent:@"boss.db"];
    return databasePath;
}
#pragma mark - Insert
- (BOOL)insertBoss:(WPBossModel *)boss {
        return [_table insertOrReplaceObject:boss];
}

#pragma mark - Update
- (BOOL)updateBoss:(WPBossModel *)boss {
    return [_table updateRowsOnProperties:WPBossModel.AllProperties
                               withObject:boss
                                    where:WPBossModel.name == boss.name];
}

#pragma mark - Delete
- (BOOL)deletBossWithBossName:(NSString *)name {
    return [_table deleteObjectsWhere:WPBossModel.name == name];

}
#pragma mark - Select
- (WPBossModel *)getBossWithBoosName:(NSString *)name {
    return [_table getObjectsWhere:WPBossModel.name == name].firstObject;

}
@end
