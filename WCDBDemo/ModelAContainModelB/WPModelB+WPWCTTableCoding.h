//
//  WPModelB+WPWCTTableCoding.h
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/1.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import "WPModelB.h"
#import <WCDB/WCDB.h>

@interface WPModelB (WPWCTTableCoding)<WCTTableCoding>
#pragma mark - 声明需要绑定到数据库表的字段
WCDB_PROPERTY(aId)
WCDB_PROPERTY(bId)
WCDB_PROPERTY(something)
@end
