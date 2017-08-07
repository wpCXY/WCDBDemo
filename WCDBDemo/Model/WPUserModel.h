//
//  WPUserModel.h
//  WCDBDemo
//
//  Created by 王鹏 on 2017/7/26.
//  Copyright © 2017年 王鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPUserModel : NSObject

@property (nonatomic, copy)   NSString  *userName;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy)   NSString  *userID;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, copy)   NSString  *location;
@property (nonatomic, copy)   NSString  *desc;

@end
