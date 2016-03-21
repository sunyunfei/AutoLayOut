//
//  ShowViewController.m
//  AutoLayOut
//
//  Created by 孙云 on 16/3/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ShowViewController.h"
#import "OneView.h"
#import "TwoView.h"
#import "ThreeView.h"
#import "FourView.h"
#import "FiveView.h"
#import "SixView.h"
@interface ShowViewController ()
@property(nonatomic,copy)NSString *str1;
@property(nonatomic,copy)NSString *str2;

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.str1 = @"温暖，是飞雪枝头上的一朵梅，一抹亮丽唤醒了寒冰的酣梦，轻声地呼唤着春天的来临。温暖，是早春柳枝上的点点嫩绿，春风浮动起的滚滚春潮。温暖，是含苞待放的小桃红，片片飞霞映红了春天的脸颊。温暖，是飘扬似雪的梨花梦，承载着辛勤园丁的丰收喜悦。温暖，是欸乃归舟时的渔家号子，唱出渔家人的豪迈心声。";
    self.str2 = @"温暖的女人，心似莲花朵朵开。温暖的女人，会在寂静的夜晚于柔和的灯光下潜心细读。一本好书，会让自己的心慢慢沉静澄净；会在闲暇时写下内心的片言只语，抒发情怀；会乘船看海，让呼啸的海风和波涛汹涌的浪潮荡涤纠结纷乱的心绪，使心胸更加豁达广阔；会静静的欣赏天边云卷云舒，细细地体会诗人王维“行到水穷处，坐看云起时”的逍遥与洒脱。云卷云舒，时刻不停地变换着自己的美丽，而唯一不变的是那颗从容淡定的心，宠辱不惊的气度；会和爱人一起去西藏，站在西藏蓝的仿佛能滴出水的天空下，感悟神圣与庄严，爱，会得到再一次升华。";
    switch (_row) {
        case 0:
            [self initOneView];
            break;
        case 1:
            [self initTwoView];
            break;
        case 2:
            [self initThreeView];
            break;
        case 3:
            [self initFourView];
            break;
        case 4:
            [self initFiveView];
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initOneView{

    OneView *oneView = [[OneView alloc]initWithFrame:self.view.bounds];
    
    [oneView firStr:_str1 secStr:_str2];
    [self.view addSubview:oneView];
}
- (void)initTwoView{

    TwoView *twoView = [[TwoView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [twoView settingsFirLabelString:_str1 secLabelString:_str2 imageViewName:@"image.jpg"];
    [self.view addSubview:twoView];
}

- (void)initThreeView{

    ThreeView *threeView = [[ThreeView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:threeView];
}
- (void)initFourView{

    FourView *fourView = [[FourView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:fourView];
}
- (void)initFiveView{

    FiveView *fiveView = [[FiveView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:fiveView];
}
- (void)initSixView{

    SixView *sixView = [[SixView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:sixView];
}
@end
