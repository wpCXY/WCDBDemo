//
//  WPModelC+WCTTableCoding.h
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/2.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import "WPModelC.h"
#import <WCDB/WCDB.h>

@interface WPModelC (WCTTableCoding)<WCTTableCoding>
WCDB_PROPERTY(cId)
WCDB_PROPERTY(modelDsJosnStr)
@end
