//
//  FourCell.m
//  AutoLayOut
//
//  Created by 孙云 on 16/3/20.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "FourCell.h"

@implementation FourCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.layer.cornerRadius = 5;
        [self.contentView addSubview:_iconImage];
        
        _footImage = [[UIImageView alloc]init];
        [self.contentView addSubview:_footImage];
        
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.222];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.numberOfLines = 0;
        [self.contentView addSubview:_nameLabel];
        
        _contentsLabel = [[UILabel alloc]init];
        _contentsLabel.backgroundColor = [UIColor colorWithRed:0.000 green:0.000 blue:1.000 alpha:0.153];
        _contentsLabel.font = [UIFont systemFontOfSize:15];
        _contentsLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentsLabel];
        
    }
    return self;
}
/**
 *  控件位置
 *
 *  @param model <#model description#>
 */
- (void)setModel:(FourModel *)model{

    _model = model;
    CGFloat KSCREENWIDTH = [UIScreen mainScreen].bounds.size.width;
    //头像位置
    UIImage *iconImage = [UIImage imageNamed:model.icon];
    _iconImage.image = iconImage;
    //图片真实宽高
//    CGFloat iconWidth = iconImage.size.width;
//    CGFloat iconHeight = iconImage.size.height;
    
    CGRect iconRect = _iconImage.frame;
    iconRect.origin.x = 15;
    iconRect.origin.y = 15;
    iconRect.size.width = 30;
    iconRect.size.height = 30;
    _iconImage.frame = iconRect;
    
    //名字位置
    _nameLabel.text = model.name;
    CGSize nameSize = [model.name boundingRectWithSize:CGSizeMake(KSCREENWIDTH * 1/3, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    CGRect nameRect = _nameLabel.frame;
    nameRect.origin.x = _iconImage.frame.origin.x + _iconImage.frame.size.width + 5;
    nameRect.origin.y = (_iconImage.frame.origin.y + _iconImage.frame.size.height) / 2;
    nameRect.size.width = nameSize.width;
    nameRect.size.height = nameSize.height;
    _nameLabel.frame = nameRect;
    
    //内容位置
    _contentsLabel.text = model.contents;
    CGSize contentsSize = [model.contents boundingRectWithSize:CGSizeMake(KSCREENWIDTH - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    CGRect contentsRect = _contentsLabel.frame;
    contentsRect.origin.x = 15;
    contentsRect.origin.y = _iconImage.frame.origin.y + _iconImage.frame.size.height + 5;
    contentsRect.size.width = contentsSize.width;
    contentsRect.size.height = contentsSize.height;
    _contentsLabel.frame = contentsRect;
    
    //图片
    if ([model.status isEqualToString:@"image"]) {
        UIImage *footImage = [UIImage imageNamed:model.imagename];
        _footImage.image = footImage;
        CGFloat footImageWidth = footImage.size.width;
        CGFloat footImageHeight = footImage.size.height;
        CGRect footRect = _footImage.frame;
        footRect.origin.x = 15;
        footRect.origin.y = _contentsLabel.frame.origin.y + _contentsLabel.frame.size.height+ 5;
        footRect.size.width = footImageWidth * ((KSCREENWIDTH - 30) / footImageWidth);
        footRect.size.height = footImageHeight *((KSCREENWIDTH - 30) / footImageWidth);
        _footImage.frame = footRect;
        
    }else{
    
        _footImage = nil;
        [_footImage removeFromSuperview];
    }
}
/**
 *  返回单元格高度
 *
 *  @param model <#model description#>
 *
 *  @return <#return value description#>
 */
+ (CGFloat)cellHeight:(FourModel *)model{

    CGFloat KSCREENWIDTH = [UIScreen mainScreen].bounds.size.width;
    CGFloat totalHeight;
    CGFloat footHeight;
    
    CGSize contentsSize = [model.contents boundingRectWithSize:CGSizeMake(KSCREENWIDTH - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    if ([model.status isEqualToString:@"image"]) {
        UIImage *footImage = [UIImage imageNamed:model.imagename];
        CGFloat footImageWidth = footImage.size.width;
        CGFloat footImageHeight = footImage.size.height;
        footHeight = footImageHeight *((KSCREENWIDTH - 30) / footImageWidth);
    }else{
    
        footHeight = 0;
    }
    totalHeight = 15 + 15 + 5 + contentsSize.height + 5 + 5 + 5 + footHeight + 5;
    return totalHeight;
}
@end
