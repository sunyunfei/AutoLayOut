//
//  TwoView.m
//  AutoLayOut
//
//  Created by 孙云 on 16/3/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "TwoView.h"
@interface TwoView()<UIScrollViewDelegate>
@property(nonatomic,assign)CGFloat allHeight;
@end
@implementation TwoView
- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        //scrollview加载
        [self initScrollView];
    }
    return self;
}
- (void)layoutSubviews{

    
}
/**
 *  加载
 */
- (void)initScrollView{

    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor yellowColor];
    [self addSubview:_scrollView];
    //加载
    [self initContents];
}
/**
 *  加载控件
 */
- (void)initContents{

    _firLabel = [[UILabel alloc]init];
    _firLabel.backgroundColor = [UIColor redColor];
    _firLabel.numberOfLines = 0;
    _firLabel.font = [UIFont systemFontOfSize:15];
    [_scrollView addSubview:_firLabel];
    
    _imageView = [[UIImageView alloc]init];
    _imageView.backgroundColor = [UIColor lightGrayColor];
    [_scrollView addSubview:_imageView];
    
    _secLabel = [[UILabel alloc]init];
    _secLabel.backgroundColor = [UIColor blueColor];
    _secLabel.numberOfLines = 0;
    _secLabel.font = [UIFont systemFontOfSize:15];
    [_scrollView addSubview:_secLabel];
}

- (void)settingsFirLabelString:(NSString *)str1 secLabelString:(NSString *)str2 imageViewName:(NSString *)str3{

    //第一个label的控件位置
    _firLabel.text = str1;
    CGSize firSize = [str1 boundingRectWithSize:CGSizeMake(self.frame.size.width - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    CGRect rect = _firLabel.frame;
    rect.origin.x = 15;
    rect.origin.y = 15;
    rect.size.width = firSize.width;
    rect.size.height = firSize.height + 5;
    _firLabel.frame = rect;
    //图片的宽高适配
    UIImage *image = [UIImage imageNamed:str3];
    CGFloat KWIDTH = [UIScreen mainScreen].bounds.size.width;
    _imageView.image = image;
    //获取图片的宽高
    CGFloat oldWidth = image.size.width;
    CGFloat oldHeight = image.size.height;
    
    CGFloat value =  KWIDTH / oldWidth;
    
    CGRect rect2 = _imageView.frame;
    rect2.origin.x = 0;
    rect2.origin.y = _firLabel.frame.origin.y + _firLabel.frame.size.height + 5;
    rect2.size.width = oldWidth * value;
    rect2.size.height = oldHeight * value;
    _imageView.frame = rect2;
    
    //第二个label的控件位置
    _secLabel.text = str2;
    CGSize secSize = [str2 boundingRectWithSize:CGSizeMake(self.frame.size.width - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    CGRect rect3 = _secLabel.frame;
    rect3.origin.x = 15;
    rect3.origin.y = _imageView.frame.origin.y + _imageView.frame.size.height + 5;
    rect3.size.width = secSize.width;
    rect3.size.height = secSize.height + 5;
    _secLabel.frame = rect3;
    //scrollview的大小
    _allHeight = _secLabel.frame.origin.y + _secLabel.frame.size.height + 5 ;
    
    [_scrollView setContentSize:CGSizeMake(0, _allHeight)];
}
@end
