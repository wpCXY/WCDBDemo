//
//  WPModelA+WPWCTTableCoding.m
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/1.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import "WPModelA+WPWCTTableCoding.h"
#import <YYModel.h>

@implementation WPModelA (WPWCTTableCoding)

#pragma mark - 定义绑定到数据库表的类
WCDB_IMPLEMENTATION(WPModelA)

#pragma mark - 定义需要绑定到数据库表的字段
WCDB_SYNTHESIZE(WPModelA, aId)
WCDB_SYNTHESIZE(WPModelA, other)


#pragma mark - 设置主键
WCDB_PRIMARY(WPModelA, aId)




#pragma mark - Overload
- (NSString *)description {
    return [self yy_modelDescription];
}
@end
