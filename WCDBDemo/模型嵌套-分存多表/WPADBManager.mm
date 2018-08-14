//
//  WPADBManager.m
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/1.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import "WPADBManager.h"
#import "WPModelA+WPWCTTableCoding.h"
#import "WPModelB+WPWCTTableCoding.h"
static WPADBManager *instance = nil;
static NSString *const ATable = @"A";
static NSString *const BTable = @"B";

@interface WPADBManager ()

@property (nonatomic, strong) WCTDatabase *dataBase;
@property (nonatomic, strong) WCTTable    *aTable;
@property (nonatomic, strong) WCTTable    *bTable;
@end


@implementation WPADBManager
#pragma mark - Life Cycle
+ (WPADBManager *)defaultManager {
    if (instance) {
        return instance;
    }
    @synchronized (self) {
        if (instance == nil) {
            instance = [[WPADBManager alloc] init];
            [instance creatADB];
            [instance creatBDB];
        }
    }
    return instance;
}
+ (void)destroy {
    instance = nil;
}

#pragma mark - Creat UserDB
- (BOOL)creatADB {
    _aTable = [self.dataBase getTableOfName:ATable
                             withClass:WPModelA.class];
    BOOL result = [_dataBase createTableAndIndexesOfName:ATable
                                               withClass:WPModelA.class];
    if (result) {
        NSLog(@"A Table Creat Success!");
        return YES;
    } else {
        NSLog(@"A Table Creat Fail!");
        return NO;
    }
}
- (BOOL)creatBDB {
    _bTable = [self.dataBase getTableOfName:BTable
                              withClass:WPModelB.class];
    BOOL result = [_dataBase createTableAndIndexesOfName:BTable
                                               withClass:WPModelB.class];
    if (result) {
        NSLog(@"B Table Creat Success!");
        return YES;
    } else {
        NSLog(@"B Table Creat Fail!");
        return NO;
    }
}


#pragma mark - Insert
- (BOOL)insertModelA:(WPModelA *)a {
    
    BOOL ret = [_dataBase beginTransaction];
    ret = [_dataBase insertObject:a into:ATable] && [_dataBase insertObject:a.modelB into:BTable];
    if (ret) {
        ret = [_dataBase commitTransaction];
    } else {
        ret = [_dataBase rollbackTransaction];
    }
    return ret;
}

#pragma mark - Update
- (BOOL)updateModeA:(WPModelA *)a {
    
    BOOL ret = [_dataBase beginTransaction];
    BOOL retA = [_dataBase updateRowsInTable:ATable
                                onProperties:WPModelA.AllProperties
                                  withObject:a
                                       where:WPModelA.aId == a.aId];
    BOOL retB = [_dataBase updateRowsInTable:BTable
                                onProperties:WPModelB.AllProperties
                                  withObject:a.modelB
                                       where:WPModelB.aId == a.aId];
    ret = retA && retB;
    if (ret) {
        ret = [_dataBase commitTransaction];
    } else {
        ret = [_dataBase rollbackTransaction];
    }
    return ret;
    
}

#pragma mark - Delete
- (BOOL)deletModelA:(WPModelA *)a {
    return [self deletModelAWithAId:a.aId];
}
- (bool)deletModelAWithAId:(NSString *)aId {
    BOOL ret = [_dataBase beginTransaction];
    BOOL retA = [_dataBase deleteObjectsFromTable:ATable
                                            where:WPModelA.aId == aId];
    BOOL retB = [_dataBase deleteObjectsFromTable:BTable
                                            where:WPModelB.aId == aId];
    ret = retA && retB;
    if (ret) {
        ret = [_dataBase commitTransaction];
    } else {
        ret = [_dataBase rollbackTransaction];
    }
    return ret;
}
- (BOOL)deletAllModelA {
    BOOL ret = [_dataBase beginTransaction];
    BOOL retA = [_dataBase deleteAllObjectsFromTable:ATable];
    BOOL retB = [_dataBase deleteAllObjectsFromTable:BTable];
    ret = retA && retB;
    if (ret) {
        ret = [_dataBase commitTransaction];
    } else {
        ret = [_dataBase rollbackTransaction];
    }
    return ret;
    
}

#pragma mark - Select
- (WPModelA *)getModelAWithAId:(NSString *)aId {
    WPModelA *modelA = [_dataBase getObjectsOfClass:WPModelA.class
                                          fromTable:ATable
                                              where:WPModelA.aId == aId].firstObject;
    modelA.modelB = [_dataBase getObjectsOfClass:WPModelB.class
                                       fromTable:BTable
                                           where:WPModelB.aId == aId].firstObject;
    return modelA;
}

#pragma mark - Getter
- (WCTDatabase *)dataBase {
    if (!_dataBase) {
        NSString *databasePath = [self getDBPath];
        _dataBase = [[WCTDatabase alloc] initWithPath:databasePath];
    }
    return _dataBase;
}
- (NSString *)getDBPath {
    NSString *databasePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/database/ABDB"];
    databasePath = [databasePath stringByAppendingPathComponent:@"ab.db"];
    return databasePath;
}
@end
