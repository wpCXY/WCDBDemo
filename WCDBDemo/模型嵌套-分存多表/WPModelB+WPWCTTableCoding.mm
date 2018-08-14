//
//  WPModelB+WPWCTTableCoding.m
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/1.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import "WPModelB+WPWCTTableCoding.h"
#import <YYModel.h>

@implementation WPModelB (WPWCTTableCoding)
#pragma mark - 定义绑定到数据库表的类
WCDB_IMPLEMENTATION(WPModelB)

#pragma mark - 定义需要绑定到数据库表的字段
WCDB_SYNTHESIZE(WPModelB, aId)
WCDB_SYNTHESIZE(WPModelB, bId)
WCDB_SYNTHESIZE(WPModelB, something)


#pragma mark - 设置主键
WCDB_PRIMARY(WPModelB, aId)

#pragma mark - 约束
WCDB_UNIQUE(WPModelB, bId)


#pragma mark - Overload
- (NSString *)description {
    return [self yy_modelDescription];
}
@end
