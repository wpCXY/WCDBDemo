//
//  WPBossModel+WCTTableCoding.m
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/14.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import "WPBossModel+WCTTableCoding.h"
#import <YYModel.h>

@implementation WPBossModel (WCTTableCoding)
#pragma mark - 定义绑定到数据库表的类
WCDB_IMPLEMENTATION(WPBossModel)

#pragma mark - 定义需要绑定到数据库表的字段
WCDB_SYNTHESIZE(WPBossModel, name)
WCDB_SYNTHESIZE(WPBossModel, worker)

#pragma mark - 设置主键
WCDB_PRIMARY(WPBossModel, name)

#pragma mark - Overload
- (NSString *)description {
    return [self yy_modelDescription];
}
@end
