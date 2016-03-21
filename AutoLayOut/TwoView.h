//
//  TwoView.h
//  AutoLayOut
//
//  Created by 孙云 on 16/3/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoView : UIView
@property(nonatomic,strong)UIScrollView *scrollView;
//三个控件
@property(nonatomic,strong)UILabel *firLabel;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *secLabel;
- (void)settingsFirLabelString:(NSString *)str1 secLabelString:(NSString *)str2 imageViewName:(NSString *)str3;
@end
