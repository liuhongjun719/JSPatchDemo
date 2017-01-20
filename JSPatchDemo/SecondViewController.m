//
//  SecondViewController.m
//  JSPatchDemo
//
//  Created by 123456 on 17/1/18.
//  Copyright © 2017年 bang. All rights reserved.
//

#import "SecondViewController.h"
#import "RequestManager.h"
#import "ResponseObject.h"

@interface SecondViewController ()<UIAlertViewDelegate>


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *vie = [[UIView alloc] initWithFrame:CGRectMake(20, 220, 100, 100)];
    [vie setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:vie];
    
    
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
