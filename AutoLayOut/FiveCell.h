//
//  FiveCell.h
//  AutoLayOut
//
//  Created by 孙云 on 16/3/21.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiveCell : UITableViewCell
@property(nonatomic,strong)NSArray *imageArray;
+(CGFloat)cellHeight:(NSArray *)array;
@end
