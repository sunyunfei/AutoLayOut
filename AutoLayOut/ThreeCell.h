//
//  ThreeCell.h
//  AutoLayOut
//
//  Created by 孙云 on 16/3/18.
//  Copyright © 2016年 haidai. All rights reserved.
/**
 *  你可以运行有时候会发现在6s或者plus上面，可能label右边的边距大于左边。这个说一下不是我写错了，一个中文占两个字符，这个正好最后一位的时候需要一个字符，所以直接把汉子放在下一行了。你可以在里面加一个英文字母试一试，就好了......
 *
 */

#import <UIKit/UIKit.h>
#import "ThreeModel.h"
@interface ThreeCell : UITableViewCell
//图片
@property (nonatomic,strong) UIImageView *cellImageView;
//内容
@property (nonatomic,strong) UILabel     *cellLabel;
@property (nonatomic,strong) ThreeModel  *model;
+ (CGFloat)cellHeightWithModel:(ThreeModel*)model;
@end
