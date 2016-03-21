//
//  ViewController.m
//  AutoLayOut
//
//  Created by 孙云 on 16/3/17.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ViewController.h"
#import "ShowViewController.h"
#import "ThreeModel.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = @[@"简单的label布局",@"图文布局",@"多数据图文布局",@"简单图文布局",@"多张图片布局",@"复杂图文布局"];
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTableView{

    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 60;
    [self.view addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * const ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:ID];
    }
    cell.textLabel.text = _array[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ShowViewController *show = [[ShowViewController alloc]init];
    show.row = indexPath.row;
    [self.navigationController pushViewController:show animated:YES];
}
@end
