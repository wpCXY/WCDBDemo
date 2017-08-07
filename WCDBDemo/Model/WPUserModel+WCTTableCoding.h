//
//  WPUserModel+WCTTableCoding.h
//  WCDBDemo
//
//  Created by 王鹏 on 2017/7/26.
//  Copyright © 2017年 王鹏. All rights reserved.
//

#import "WPUserModel.h"
#import <WCDB/WCDB.h>

@interface WPUserModel (WCTTableCoding) <WCTTableCoding>

#pragma mark - 声明需要绑定到数据库表的字段
WCDB_PROPERTY(userName)
WCDB_PROPERTY(age)
WCDB_PROPERTY(userID)
WCDB_PROPERTY(sex)
WCDB_PROPERTY(location)
WCDB_PROPERTY(desc)

@end
