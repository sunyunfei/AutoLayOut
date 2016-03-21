//
//  FiveView.h
//  AutoLayOut
//
//  Created by 孙云 on 16/3/21.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiveView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *cellArray;
@end
