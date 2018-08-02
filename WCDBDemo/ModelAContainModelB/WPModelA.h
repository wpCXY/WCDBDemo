//
//  WPModelA.h
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/1.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPModelB.h"
@interface WPModelA : NSObject
@property (nonatomic, copy)   NSString *aId;
@property (nonatomic, copy)   NSString *other;
@property (nonatomic, strong) WPModelB *modelB;
@end
