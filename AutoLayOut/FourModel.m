//
//  FourModel.m
//  AutoLayOut
//
//  Created by 孙云 on 16/3/20.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "FourModel.h"

@implementation FourModel
- (instancetype)initWithDic:(NSDictionary *)dic{

    self = [super init];
    if (self) {
        self.name      = dic[@"name"];
        self.imagename = dic[@"imagename"];
        self.icon      = dic[@"icon"];
        self.contents  = dic[@"contents"];
        self.status    = dic[@"status"];
    }
    return self;
}
@end
