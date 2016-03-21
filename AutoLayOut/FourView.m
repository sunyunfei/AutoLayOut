//
//  FourView.m
//  AutoLayOut
//
//  Created by 孙云 on 16/3/20.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "FourView.h"
#import "FourCell.h"
#import "FourModel.h"
@implementation FourView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self initTableView];
    }
    return self;
}
- (void)initTableView{

    _tableView = [[UITableView alloc]initWithFrame:self.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
}
- (NSArray *)cellArray{

    if (_cellArray == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"four.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *array2 = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            FourModel *model = [[FourModel alloc]initWithDic:dic];
            [array2 addObject:model];
        }
        _cellArray = array2;
    }
    return _cellArray;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.cellArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *const ID = @"cell";
    FourCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[FourCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = self.cellArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    FourModel *model = self.cellArray[indexPath.row];
    return [FourCell cellHeight:model];
}
@end
