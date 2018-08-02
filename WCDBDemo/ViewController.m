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
#import <YYModel.h>

@interface ViewController ()
@property (nonatomic, strong) WPADBManager *aDBManager;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _aDBManager = [WPADBManager defaultManager];
//    [self insertModelA];
//    [self getModelA];
//    [self deleteModelA];
//    [self getModelA];
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


@end
