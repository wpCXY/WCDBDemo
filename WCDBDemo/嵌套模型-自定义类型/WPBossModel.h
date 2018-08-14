//
//  WPBossModel.h
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/14.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPWorkerModel.h"

@interface WPBossModel : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) WPWorkerModel *worker;



@end
