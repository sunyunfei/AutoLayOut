//
//  ThreeCell.m
//  AutoLayOut
//
//  Created by 孙云 on 16/3/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ThreeCell.h"

@implementation ThreeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //加载控件
        _cellImageView = [[UIImageView alloc]init];
        _cellImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_cellImageView];
        
        _cellLabel = [[UILabel alloc]init];
        _cellLabel.backgroundColor = [UIColor colorWithRed:0.000 green:0.000 blue:1.000 alpha:0.366];
        _cellLabel.numberOfLines = 0;
        _cellLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_cellLabel];
    }
    return self;
}
/**
 *  控件的大小位置
 */
- (void)setModel:(ThreeModel *)model{

    _model = model;
    self.cellLabel.text = model.cellContents;
    
    //获取大小
    CGFloat KSCREENWIDTH = CGRectGetWidth([UIApplication sharedApplication].keyWindow.bounds);
    //label的位置大小
    CGSize labelSize = [model.cellContents boundingRectWithSize:CGSizeMake(KSCREENWIDTH - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    CGRect rectLabel = _cellLabel.frame;
    rectLabel.origin.x = 15;
    rectLabel.origin.y = 5;
    rectLabel.size.width = labelSize.width;
    rectLabel.size.height = labelSize.height + 5;
    _cellLabel.frame = rectLabel;
    
    //图片的位置大小
    UIImage *imageName = [UIImage imageNamed:model.cellImage];
    self.cellImageView.image = imageName;
    CGFloat imageWidth = imageName.size.width;
    CGFloat imageHeight = imageName.size.height;
    
    //获取比例
    CGRect rectImage = _cellImageView.frame;
    rectImage.origin.x = 15;
    rectImage.origin.y = _cellLabel.frame.origin.y + _cellLabel.frame.size.height;
    rectImage.size.width = imageWidth *(KSCREENWIDTH - 30) / imageWidth;
    rectImage.size.height = imageHeight *(KSCREENWIDTH - 30) / imageWidth;
    _cellImageView.frame = rectImage;
}
/**
 *  获取单元格的高度
 *
 *  @param model <#model description#>
 *
 *  @return <#return value description#>
 */
+ (CGFloat)cellHeightWithModel:(ThreeModel*)model{

    //获取大小
    CGFloat KSCREENWIDTH = [UIScreen mainScreen].bounds.size.width;
    CGFloat totalHeight = 0;
    CGSize labelSize = [model.cellContents boundingRectWithSize:CGSizeMake(KSCREENWIDTH - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    //图片的位置大小
    UIImage *imageName = [UIImage imageNamed:model.cellImage];
    
    CGFloat imageHeight = imageName.size.height;
    CGFloat imageWidth = imageName.size.width;
    totalHeight = 5 + labelSize.height + 5 + imageHeight *(KSCREENWIDTH - 30) / imageWidth ;
    return totalHeight;
    
}
@end
