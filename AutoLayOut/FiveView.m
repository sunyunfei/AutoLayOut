//
//  FiveView.m
//  AutoLayOut
//
//  Created by 孙云 on 16/3/21.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "FiveView.h"
#import "FiveCell.h"
#import "FiveCell.h"
@implementation FiveView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self initTableView];
        
    }
    return self;
}
/**
 *  数据加载
 */
- (NSArray *)cellArray{

    if (_cellArray == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"five.plist" ofType:nil];
        NSArray *array1 = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *array2 = [NSMutableArray array];
        for (NSDictionary *dic in array1) {
            [array2 addObject:dic[@"imagename"]];
        }
        _cellArray = array2;
    }
    return _cellArray;
}
/**
 *  加载表
 */
- (void)initTableView{

    _tableView = [[UITableView alloc]initWithFrame:self.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorColor = [UIColor redColor];
    [self addSubview:_tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.cellArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * const ID = @"cell";
    //FiveCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //根据indexPath准确地取出一行，而不是从cell重用队列中取出
    FiveCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[FiveCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.imageArray = self.cellArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [FiveCell cellHeight:self.cellArray[indexPath.row]];
}
@end
