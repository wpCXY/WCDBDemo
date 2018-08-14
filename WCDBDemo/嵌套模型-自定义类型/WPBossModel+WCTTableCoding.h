//
//  WPBossModel+WCTTableCoding.h
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/14.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import "WPBossModel.h"
#import <WCDB/WCDB.h>

@interface WPBossModel (WCTTableCoding) <WCTTableCoding>
WCDB_PROPERTY(name)
WCDB_PROPERTY(worker)
@end
