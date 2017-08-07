//
//  WPUserModel+WCTTableCoding.m
//  WCDBDemo
//
//  Created by 王鹏 on 2017/7/26.
//  Copyright © 2017年 王鹏. All rights reserved.
//

#import "WPUserModel+WCTTableCoding.h"
#import <YYModel.h>
@implementation WPUserModel (WCTTableCoding)


#pragma mark - 定义绑定到数据库表的类
WCDB_IMPLEMENTATION(WPUserModel)

#pragma mark - 定义需要绑定到数据库表的字段
WCDB_SYNTHESIZE(WPUserModel, userName)
WCDB_SYNTHESIZE(WPUserModel, age)
WCDB_SYNTHESIZE(WPUserModel, userID)
WCDB_SYNTHESIZE(WPUserModel, sex)
WCDB_SYNTHESIZE(WPUserModel, location)
WCDB_SYNTHESIZE(WPUserModel, desc)

#pragma mark - 设置主键
WCDB_PRIMARY(WPUserModel, userID)

#pragma mark - 设置索引
WCDB_INDEX(WPUserModel, "_index", age)


#pragma mark - Overload
- (NSString *)description {
    return [self yy_modelDescription];
}
@end
