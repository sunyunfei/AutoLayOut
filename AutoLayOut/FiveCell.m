//
//  FiveCell.m
//  AutoLayOut
//
//  Created by 孙云 on 16/3/21.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "FiveCell.h"
#define KSCREENWIDTH  [UIApplication sharedApplication].keyWindow.screen.bounds.size.width
#define KSCREENHEIGHT  [UIScreen mainScreen].bounds.size.height
@implementation FiveCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
/**
 *  数据加载
 *
 *  @param imageArray <#imageArray description#>
 */
- (void)setImageArray:(NSArray *)imageArray{

    _imageArray = imageArray;
    /**
     *  根据数据布局imageview
     */
    for (NSInteger i = 0; i < imageArray.count; i ++) {
        //创建imageview
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.046];
        //数据赋予
        imageView.image = [UIImage imageNamed:imageArray[i]];
        [self.contentView addSubview:imageView];
        
        //位置大小(假设一行3个)
        CGRect rect = imageView.frame;
        rect.origin.x = (KSCREENWIDTH /3) * (i % 3) + 5;
        rect.origin.y = (KSCREENWIDTH /3) * (i / 3) + 15;
        rect.size.width = (KSCREENWIDTH /3 - 10);
        rect.size.height = (KSCREENWIDTH /3 - 10);
        imageView.frame = rect;
    }
   
}
/**
 *  单元格高度
 *
 *  @param array <#array description#>
 *
 *  @return <#return value description#>
 */
+(CGFloat)cellHeight:(NSArray *)array{

    CGFloat totalHeight;
    totalHeight = array.count / 3 *(KSCREENWIDTH / 3)+ (KSCREENWIDTH /3) + 5 + 15;
    if (array.count % 3 == 0) {
        totalHeight -= (KSCREENWIDTH /3);
    }
    return totalHeight;
}
@end
