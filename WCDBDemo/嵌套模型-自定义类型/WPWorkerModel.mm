//
//  WPWorkerModel.m
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/14.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import "WPWorkerModel.h"
#import <YYModel.h>
#import <WCDB.h>

@interface WPWorkerModel () <WCTColumnCoding>

@end

@implementation WPWorkerModel
+ (instancetype)unarchiveWithWCTValue:(NSString *)value {
    WPWorkerModel *work = [WPWorkerModel yy_modelWithJSON:value];
    return work;
}
- (NSString *)archivedWCTValue {
    return self.yy_modelToJSONString;
}
+ (WCTColumnType)columnTypeForWCDB {
    return WCTColumnTypeString;
}
#pragma mark - Overload
- (NSString *)description {
    return [self yy_modelDescription];
}
@end
