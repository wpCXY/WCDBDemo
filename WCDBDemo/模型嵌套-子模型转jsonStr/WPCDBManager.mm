//
//  WPCDBManager.m
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/2.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import "WPCDBManager.h"
#import "WPModelC+WCTTableCoding.h"
static WPCDBManager *instance = nil;
static NSString *const CTable = @"c";
@interface WPCDBManager ()
@property (nonatomic, strong) WCTDatabase *dataBase;
@property (nonatomic, strong) WCTTable    *table;

@end
@implementation WPCDBManager
#pragma mark - Life Cycle
+ (WPCDBManager *)defaultManager {
    if (instance) {
        return instance;
    }
    @synchronized (self) {
        if (instance == nil) {
            instance = [[WPCDBManager alloc] init];
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
    _table = [_dataBase getTableOfName:CTable
                             withClass:WPModelC.class];
    BOOL result = [_dataBase createTableAndIndexesOfName:CTable
                                               withClass:WPModelC.class];
    if (result) {
        NSLog(@"C Table Creat Success!");
        return YES;
    } else {
        NSLog(@"C Table Creat Fail!");
        return NO;
    }
    
}
- (NSString *)getDBPath {
    NSString *databasePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/database/c"];
    databasePath = [databasePath stringByAppendingPathComponent:@"c.db"];
    return databasePath;
}
#pragma mark - Insert
- (BOOL)insertModelC:(WPModelC *)c {
    
    return [_table insertOrReplaceObject:c];
//    return [_table insertObject:c];
}

#pragma mark - Update
- (BOOL)updateModeC:(WPModelC *)c {
    return [_table updateRowsOnProperties:WPModelC.AllProperties
                               withObject:c
                                    where:WPModelC.cId == c.cId];
}

#pragma mark - Delete
- (BOOL)deletModelC:(WPModelC *)c {
    return [_table deleteObjectsWhere:WPModelC.cId == c.cId];
}
- (BOOL)deletAllModelC {
    return [_table deleteAllObjects];
}
- (BOOL)deletModelCWithCId:(NSString *)cId {
    return [_table deleteObjectsWhere:WPModelC.cId == cId];
}

#pragma mark - Select
- (WPModelC *)getModelWithCId:(NSString *)cId {
    return [_table getObjectsWhere:WPModelC.cId == cId].firstObject;
}

@end
