//
//  ViewController.m
//  JSPatchDemo
//
//  Created by 123456 on 17/1/19.
//  Copyright © 2017年 123456. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
    [btn setTitle:@"Push JSTableViewController" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
    
    UIButton *btnSecond = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 50)];
    [btnSecond setTitle:@"Push SecondViewController" forState:UIControlStateNormal];
    [btnSecond addTarget:self action:@selector(handlebtnSecond:) forControlEvents:UIControlEventTouchUpInside];
    [btnSecond setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btnSecond];
}

- (void)handleBtn:(id)sender
{
}

- (void)handlebtnSecond:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
