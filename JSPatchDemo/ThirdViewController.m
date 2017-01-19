//
//  ThirdViewController.m
//  JSPatchDemo
//
//  Created by 123456 on 17/1/19.
//  Copyright © 2017年 bang. All rights reserved.
//

#import "ThirdViewController.h"
#import "ThirdTableViewCell.h"
@interface ThirdViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.title = @"ThirdViewController";
//    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//    tableview.delegate = self;
//    tableview.dataSource = self;
//    [self.view addSubview:tableview];
//    [tableview setDelegate:self];
//    [tableview setDataSource:self];
    
//    [tableview registerNib:[UINib nibWithNibName:@"ThirdTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
//    [tableview  registerClass:[ThirdTableViewCell class] forCellReuseIdentifier:@"cell"];
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
