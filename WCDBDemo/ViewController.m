//
//  ViewController.m
//  WCDBDemo
//
//  Created by 王鹏 on 2017/7/26.
//  Copyright © 2017年 王鹏. All rights reserved.
//

#import "ViewController.h"
#import "WPUserDBManager.h"
#import "WPADBManager.h"
#import "WPCDBManager.h"
#import <YYModel.h>

@interface ViewController ()
@property (nonatomic, strong) WPADBManager *aDBManager;
@property (nonatomic, strong) WPCDBManager *cDBManager;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    _aDBManager = [WPADBManager defaultManager];
//    [self insertModelA];
//    [self getModelA];
//    [self deleteModelA];
//    [self getModelA];
    
    _cDBManager = [WPCDBManager defaultManager];
//    [self insertModelC];
//    [self getModelC];
//    [self deleteModelC];
//    [self getModelC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - TestADBManager 模型A嵌套模型B 一对一
- (void)insertModelA {
    WPModelA *modelA = [WPModelA new];
    modelA.aId = @"aaaa";
    modelA.other = @"this is model A";
    WPModelB *modelB = [WPModelB new];
    modelB.aId = modelA.aId;
    modelB.bId = @"bbbb";
    modelB.something = @"this is model B";
    modelA.modelB = modelB;
    
    [_aDBManager insertModelA:modelA];
}
- (void)getModelA {
    WPModelA *modelA = [_aDBManager getModelAWithAId:@"aaaa"];
    NSLog(@"%@",modelA);
}
- (void)deleteModelA {
    BOOL res = [_aDBManager deletModelAWithAId:@"aaaa"];
    if (res) {
        NSLog(@"删除ModelA成功！");
    } else{
        NSLog(@"删除ModelA失败！");
    }
}
#pragma mark - TestCDBManager 模型C嵌套多个模型D 一对多
- (void)insertModelC {
    WPModelC *modelc = [WPModelC new];
    modelc.cId = @"cccc";

    WPModelD *modeld1 = [WPModelD new];
    modeld1.propertyOne = @"modeld1";
    modeld1.propertyTwo = @"modeld1";
    modeld1.propertyThree = @"modeld1";
    
    WPModelD *modeld2 = [WPModelD new];
    modeld2.propertyOne = @"modeld2";
    modeld2.propertyTwo = @"modeld2";
    modeld2.propertyThree = @"modeld2";
    
    modelc.modelDs = @[modeld1, modeld2];
    
     BOOL res =  [_cDBManager insertModelC:modelc];
    if (res) {
        NSLog(@"插入成功！");
    }
}
- (void)getModelC {
    WPModelC *modelC = [_cDBManager getModelWithCId:@"cccc"];
    NSLog(@"%@",modelC);
}
- (void)deleteModelC {
    BOOL res = [_cDBManager deletModelCWithCId:@"cccc"];
    if (res) {
        NSLog(@"删除Modelc成功！");
    } else{
        NSLog(@"删除Modelc失败！");
    }
}
@end
