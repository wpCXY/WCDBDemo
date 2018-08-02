//
//  WPModelC+WCTTableCoding.m
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/2.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import "WPModelC+WCTTableCoding.h"

@implementation WPModelC (WCTTableCoding)

#pragma mark - 定义绑定到数据库表的类
WCDB_IMPLEMENTATION(WPModelC)

#pragma mark - 定义需要绑定到数据库表的字段
WCDB_SYNTHESIZE(WPModelC, cId)
WCDB_SYNTHESIZE(WPModelC, modelDsJosnStr)

#pragma mark - 设置主键
WCDB_PRIMARY(WPModelC, cId)

@end
