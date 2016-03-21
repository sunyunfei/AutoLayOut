
//
//  ThreeView.m
//  AutoLayOut
//
//  Created by 孙云 on 16/3/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ThreeView.h"
#import "ThreeModel.h"
#import "ThreeCell.h"
@interface ThreeView()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *cellArray;
@end
@implementation ThreeView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self initTableView];
    }
    return self;
}
-(void)initTableView{

    _tableView = [[UITableView alloc]initWithFrame:self.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
}
- (NSArray *)cellArray{
    
    if (_cellArray == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"three.plist" ofType:nil];
        NSArray *array3 = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *array4 = [NSMutableArray array];
        for (NSDictionary *dic in array3) {
            ThreeModel *model = [[ThreeModel alloc]initWithDic:dic];
            [array4 addObject:model];
        }
        _cellArray = array4;
    }
    return _cellArray;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.cellArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * const ID = @"cell";
    ThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ThreeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = self.cellArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    ThreeModel *model = self.cellArray[indexPath.row];
    return [ThreeCell cellHeightWithModel:model];
}
@end
