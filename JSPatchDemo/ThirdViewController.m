//
//  ThirdViewController.m
//  JSPatchDemo
//
//  Created by 123456 on 17/1/19.
//  Copyright © 2017年 bang. All rights reserved.
//

#import "ThirdViewController.h"
#import "ThirdTableViewCell.h"
#import "RequestManager.h"
#import "ResponseObject.h"

@interface ThirdViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) ResponseObject *responseObject;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSString *stringOne;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stringOne = @"mmmmmmmmmmmm";
    _dataArray = [NSArray array];
    
    [self requestData];
}


- (void)requestData {
    [[RequestManager sharedInstance] requestWithType:GetDataTypeGet urlString:TopicOrderSourceUrl  parameters:nil interfaceType:TopicOrderSourceUrl_interface finished:^(id response, NSError *error) {
        _responseObject = response;
        _dataArray = _responseObject.info;
        NSLog(@"===========:%lu", (unsigned long)_dataArray.count);
    }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
