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
#import "WPBossDBManager.h"
#import <YYModel.h>

@interface ViewController ()
@property (nonatomic, strong) WPBossDBManager *bossDBManager;
@property (nonatomic, strong) WPADBManager *aDBManager;
@property (nonatomic, strong) WPCDBManager *cDBManager;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _bossDBManager = [WPBossDBManager defaultManager];
    [self insertBossModel];
//    [self getBossModel];
//    [self deleteBossModel];
//    [self getBossModel];

//    _aDBManager = [WPADBManager defaultManager];
//    [self insertModelA];
//    [self getModelA];
//    [self deleteModelA];
//    [self getModelA];
    
//    _cDBManager = [WPCDBManager defaultManager];
//    [self insertModelC];
//    [self getModelC];
//    [self deleteModelC];
//    [self getModelC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - 模型嵌套-自定义类型
- (void)insertBossModel {
    WPBossModel *boss = [WPBossModel new];
    boss.name = @"name";
    WPWorkerModel *worker = [WPWorkerModel new];
    worker.name = @"workname";
    worker.skill = @"eat";
    boss.worker = worker;
    [_bossDBManager insertBoss:boss];
    
}
- (void)getBossModel {
    WPBossModel *boss = [_bossDBManager getBossWithBoosName:@"name"];
    NSLog(@"%@",boss);
}
- (void)deleteBossModel{
    BOOL res = [_bossDBManager deletBossWithBossName:@"name"];
    if (res) {
        NSLog(@"删除ModelA成功！");
    } else{
        NSLog(@"删除ModelA失败！");
    }
}

#pragma mark - 模型嵌套-分存多表
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
#pragma mark - 模型嵌套-子模型转jsonStr保存
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
