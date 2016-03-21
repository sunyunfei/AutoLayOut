//
//  FourModel.h
//  AutoLayOut
//
//  Created by 孙云 on 16/3/20.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FourModel : NSObject
@property (nonatomic,copy  ) NSString *icon;
@property (nonatomic,copy  ) NSString *contents;
@property (nonatomic,copy  ) NSString *imagename;
@property (nonatomic,copy  ) NSString *name;
@property (nonatomic,copy  ) NSString *status;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
