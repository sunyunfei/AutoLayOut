//
//  ThreeModel.m
//  AutoLayOut
//
//  Created by 孙云 on 16/3/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ThreeModel.h"

@implementation ThreeModel
- (instancetype)initWithDic:(NSDictionary *)dic{

    self = [super init];
    if (self) {
        self.cellImage = dic[@"cellImage"];
        self.cellContents = dic[@"cellContents"];
    }
    return self;
}
@end
