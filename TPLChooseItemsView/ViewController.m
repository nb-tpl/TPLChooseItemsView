//
//  ViewController.m
//  TPLChooseItemsView
//
//  Created by 谭鄱仑 on 15-1-28.
//  Copyright (c) 2015年 谭鄱仑. All rights reserved.
//

#import "ViewController.h"
#import "TPLChooseItemsView.h"

@interface ViewController ()
{
    TPLChooseItemsView * _chooseItemsView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self addChooseItemBackView];
}

//添加选择元素视图背景
-(void)addChooseItemBackView
{
    UIImageView * chooseItemsBackView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64 + 150, self.view.bounds.size.width, 600)];
    chooseItemsBackView.userInteractionEnabled = YES;
    chooseItemsBackView.backgroundColor = [UIColor colorWithWhite:0.975 alpha:1.000];
    [self.view addSubview:chooseItemsBackView];
    
    UILabel * signLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 0,200, 20)];
    signLabel.backgroundColor = [UIColor clearColor];
    signLabel.textColor = [UIColor colorWithWhite:0.560 alpha:1.000];
    signLabel.font = [UIFont systemFontOfSize:18];
    signLabel.text = @"商品类型：";
    [chooseItemsBackView addSubview:signLabel];
    
    /* tpl 使用方法 */
    _chooseItemsView = [[TPLChooseItemsView alloc] initWithFrame:CGRectMake(chooseItemsBackView.bounds.origin.x,signLabel.frame.size.height + 10, chooseItemsBackView.frame.size.width, chooseItemsBackView.frame.size.height - signLabel.frame.size.height - 10)];
    _chooseItemsView.backgroundColor = [UIColor colorWithWhite:0.975 alpha:1.000];
    [chooseItemsBackView addSubview:_chooseItemsView];
    //    _chooseItemsView.titleArray = @[@"全部",@"一段奶粉",@"羊奶粉",@"国产奶粉",@"抗敏"];
    NSArray * titleArray = @[@"1",@"二二",@"三三三",@"四四四四",@"五五五五五",@"六六六六六六",@"七七七七七七七七",@"八八八八八八八八"];
    NSArray * backImages = @[@"shequ_sheying.png",@"shequ_sheying.png",@"shequ_sheying.png",@"shequ_sheying.png",@"shequ_sheying.png",@"shequ_sheying.png",@"shequ_sheying.png",@"shequ_sheying.png"];
//    for (MMSTag * tag in _switchType.taglist)
//    {
//        [titleArray addObject:tag.tag_name];
//    }
    
    _chooseItemsView.titleArray = titleArray;
    _chooseItemsView.backImagesArray = backImages;
    
    _chooseItemsView.itemHeight = 35;
    _chooseItemsView.itemFont = [UIFont systemFontOfSize:17];
    _chooseItemsView.xSpace = 15;
    _chooseItemsView.ySpace = 13;
    _chooseItemsView.itemWidth = (300 - 30)/3;
    _chooseItemsView.isNeat = NO;
    _chooseItemsView.isFitLength = NO;
    _chooseItemsView.isMutableChoose = NO;
;
    _chooseItemsView.horizontalMargin = signLabel.frame.origin.x;
    
    
    _chooseItemsView.itemHorizontalLeftMargin = 10;
    _chooseItemsView.itemHorizontalRightMargin = 20;
    
    _chooseItemsView.clickedChooseItem = ^(TPLChooseItemsView *chooseView, ChooseItem *item) {

    };
    
    _chooseItemsView.refresh  = ^(TPLChooseItemsView *chooseView, ChooseItem *item) {
        
        if(item.isChoose) {
            item.layer.borderColor = [UIColor redColor].CGColor;
            item.textLabel.textColor = [UIColor redColor];
            item.layer.borderWidth = 1;
        }else
        {
            item.layer.borderColor = [UIColor greenColor].CGColor;
            item.textLabel.textColor = [UIColor greenColor];
            item.layer.borderWidth = 1;
        }        
    };

    [_chooseItemsView refreshView];
//    [_chooseItemsView clickedItemIndex:0];
    
    /* tpl 使用方法 */
    
    //多选
    UIButton * moreChooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreChooseButton.backgroundColor = [UIColor orangeColor];
    moreChooseButton.frame = CGRectMake(10, chooseItemsBackView.frame.origin.y - 70, 80, 30);
    [moreChooseButton setTitle:@"单选" forState:UIControlStateNormal];
    [moreChooseButton addTarget:self action:@selector(moreButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:moreChooseButton];
    
    //顶边
    UIButton * neatChooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    neatChooseButton.backgroundColor = [UIColor orangeColor];
    neatChooseButton.frame = CGRectMake(10 + 90, chooseItemsBackView.frame.origin.y - 70, 80, 30);
    [neatChooseButton setTitle:@"不顶边" forState:UIControlStateNormal];
    [neatChooseButton addTarget:self action:@selector(neatButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:neatChooseButton];
    
    
    //自适应
    UIButton * fitChooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fitChooseButton.backgroundColor = [UIColor orangeColor];
    fitChooseButton.frame = CGRectMake(10 + 90 + 90, chooseItemsBackView.frame.origin.y - 70, 80, 30);
    [fitChooseButton setTitle:@"不自适应" forState:UIControlStateNormal];
    [fitChooseButton addTarget:self action:@selector(fitChooseButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fitChooseButton];


    
    
    
    
    
}

#pragma mark
#pragma mark           button clicked
#pragma mark
-(void)moreButtonClicked:(id)sender
{
    UIButton * button = (UIButton*)sender;
    if ([button.titleLabel.text isEqualToString:@"单选"])
    {
        [button setTitle:@"多选" forState:UIControlStateNormal];
    }
    else
    {
        [button setTitle:@"单选" forState:UIControlStateNormal];
    }

    _chooseItemsView.isMutableChoose = !_chooseItemsView.isMutableChoose;
}

-(void)neatButtonClicked:(id)sender
{
    UIButton * button = (UIButton*)sender;
    if ([button.titleLabel.text isEqualToString:@"不顶边"])
    {
        [button setTitle:@"顶边" forState:UIControlStateNormal];
    }
    else
    {
        [button setTitle:@"不顶边" forState:UIControlStateNormal];
    }
    
    _chooseItemsView.isNeat = !_chooseItemsView.isNeat;
    [_chooseItemsView refreshView];
}
-(void)fitChooseButtonClicked:(id)sender
{
    UIButton * button = (UIButton*)sender;
    if ([button.titleLabel.text isEqualToString:@"不自适应"])
    {
        [button setTitle:@"自适应" forState:UIControlStateNormal];
    }
    else
    {
        [button setTitle:@"不自适应" forState:UIControlStateNormal];
    }
    
    _chooseItemsView.isFitLength = !_chooseItemsView.isFitLength;
    [_chooseItemsView refreshView];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
