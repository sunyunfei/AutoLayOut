//
//  FourView.h
//  AutoLayOut
//
//  Created by 孙云 on 16/3/20.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *cellArray;
@end
