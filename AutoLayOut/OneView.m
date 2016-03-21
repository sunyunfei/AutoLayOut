//
//  OneView.m
//  AutoLayOut
//
//  Created by 孙云 on 16/3/17.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "OneView.h"

@implementation OneView

- (instancetype)initWithFrame:(CGRect)frame{

    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self initLabel];
    }
    return self;
}
/**
 *  加载label
 */
- (void)initLabel{

    _firLabel = [[UILabel alloc]init];
    _firLabel.backgroundColor = [UIColor redColor];
    _firLabel.font = [UIFont systemFontOfSize: 15];
    _firLabel.numberOfLines = 0;
    [self addSubview:_firLabel];
    
    _secLabel = [[UILabel alloc]init];
    _secLabel.backgroundColor = [UIColor blueColor];
    _secLabel.font = [UIFont systemFontOfSize:15];
    _secLabel.numberOfLines = 0;
    [self addSubview:_secLabel];
}
/**
 *  布局
 */
- (void)firStr:(NSString *)str1 secStr:(NSString *)str2{

    _firLabel.text = str1;
    _secLabel.text = str2;
    CGSize firSize = [str1 boundingRectWithSize:CGSizeMake(self.frame.size.width - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
   CGFloat sizeWidth  = firSize.width;
   CGFloat sizeHeight = firSize.height + 5;
   CGRect rect        = _firLabel.frame;
   rect.size.width    = sizeWidth;
   rect.size.height   = sizeHeight;
   rect.origin.x      = 15;
   rect.origin.y      = 5;
   _firLabel.frame    = rect;
   
    CGSize secSize = [str2 boundingRectWithSize:CGSizeMake(self.frame.size.width - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    CGFloat width = secSize.width;
    CGFloat height = secSize.height + 5;
    CGRect rect2 = _secLabel.frame;
    rect2.size.width = width;
    rect2.size.height = height;
    rect2.origin.x = 15;
    rect2.origin.y =(_firLabel.frame.origin.y + _firLabel.frame.size.height) + 5;
    _secLabel.frame = rect2;
    
    CGRect rect3 = self.frame;
    rect3.size.height = (_secLabel.frame.origin.y + _secLabel.frame.size.height)+ 5;
    rect3.origin.y = 75;
    self.frame = rect3;
}
@end
