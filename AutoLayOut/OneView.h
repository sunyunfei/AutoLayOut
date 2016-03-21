//
//  OneView.h
//  AutoLayOut
//
//  Created by 孙云 on 16/3/17.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneView : UIView
@property(nonatomic,strong)UILabel *firLabel;
@property(nonatomic,strong)UILabel *secLabel;
- (void)firStr:(NSString *)str1 secStr:(NSString *)str2;
@end
