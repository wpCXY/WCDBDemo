//
//  WPModelC.h
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/2.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPModelD.h"
@interface WPModelC : NSObject
@property (nonatomic, copy) NSString *cId;
@property (nonatomic, copy) NSString *modelDsJosnStr;
@property (nonatomic, copy) NSArray <WPModelD *> *modelDs;
@end
