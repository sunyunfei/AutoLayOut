//
//  FourCell.h
//  AutoLayOut
//
//  Created by 孙云 on 16/3/20.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FourModel.h"
@interface FourCell : UITableViewCell
@property(nonatomic,strong)UIImageView *iconImage;//头像
@property(nonatomic,strong)UIImageView *footImage;//底部视图
@property(nonatomic,strong)UILabel *nameLabel;//名字
@property(nonatomic,strong)UILabel *contentsLabel;//内容
@property(nonatomic,strong)FourModel *model;
//单元格的高度
+ (CGFloat)cellHeight:(FourModel *)model;
@end
