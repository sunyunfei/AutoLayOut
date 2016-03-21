//
//  ThreeModel.h
//  AutoLayOut
//
//  Created by 孙云 on 16/3/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThreeModel : NSObject
@property(nonatomic,copy)NSString *cellImage;
@property(nonatomic,copy)NSString *cellContents;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
