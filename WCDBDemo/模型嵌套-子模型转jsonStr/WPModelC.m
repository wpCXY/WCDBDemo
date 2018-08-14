//
//  WPModelC.m
//  WCDBDemo
//
//  Created by 王鹏 on 2018/8/2.
//  Copyright © 2018年 王鹏. All rights reserved.
//

#import "WPModelC.h"
#import <YYModel.h>
@implementation WPModelC


#pragma mark - Getter
// 存入数据库时，将数组转json
- (NSString *)modelDsJosnStr {
    if (_modelDsJosnStr == nil) {
        _modelDsJosnStr = [self yy_modelToJSONString];
    }
    return _modelDsJosnStr;
}
// 从数据库取出后，使用时，将json转成数组
- (NSArray<WPModelD *> *)modelDs {
    if (_modelDs == nil) {
        WPModelC *modelc = [WPModelC yy_modelWithJSON:_modelDsJosnStr];
        _modelDs = modelc.modelDs;
    }
    return _modelDs;
}
#pragma mark - YYModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"modelDs" : [WPModelD class]};
}
+ (NSArray *)modelPropertyBlacklist {
    return @[@"modelDsJosnStr"];
}
- (NSString *)description
{
    return [self yy_modelDescription];
}
@end
