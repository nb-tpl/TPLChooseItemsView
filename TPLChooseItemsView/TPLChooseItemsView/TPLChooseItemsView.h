//
//  IFChooseItemsView.h
//  MaMaShoppingPro
//
//  Created by 谭鄱仑 on 14-9-18.
//  Copyright (c) 2014年 谭鄱仑. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChooseItem : UILabel



@property(nonatomic,assign)BOOL isChoose;

@property(nonatomic,strong)UIColor * chooseColor;
@property(nonatomic,strong)UIColor * normalColor;

@property(nonatomic,strong)void (^clicked)(ChooseItem * item);


-(void)tapOne:(UITapGestureRecognizer * )tapOne;


@end




@interface TPLChooseItemsView : UIImageView
@property(nonatomic,strong)NSArray   * titleArray;
@property(nonatomic,readonly)NSArray * chooseArray;
@property(nonatomic,readonly)NSArray * itemArray;
//多选后拼接的字符串
@property(nonatomic,readonly)NSString * chooseString;


//是否自适应长度,默认为YES
@property(nonatomic,assign)BOOL isFitLength;
//是否顶边，默认顶边
@property(nonatomic,assign)BOOL isNeat;
//是否多选，默认多选
@property(nonatomic,assign)BOOL isMutableChoose;


///标签的配置
//标签的高度
@property(nonatomic,assign)CGFloat itemHeight;
//标签的宽度
@property(nonatomic,assign)CGFloat itemWidth;
//标签的字体
@property(nonatomic,strong)UIFont  * itemFont;
@property(nonatomic,strong)UIColor * itemTextColor;
//标签的最短长度
@property(nonatomic,assign)CGFloat itemMixLength;
//长内容的标签左右边距
@property(nonatomic,assign)CGFloat itemHorizontalMargin;

@property(nonatomic,strong)UIColor * itemChooseColor;
@property(nonatomic,strong)UIColor * itemNormalColor;


@property(nonatomic,assign)CGFloat horizontalMargin;
@property(nonatomic,assign)CGFloat vertaicalMargin;
@property(nonatomic,assign)CGFloat xSpace;
@property(nonatomic,assign)CGFloat ySpace;


//标签颜色数组
@property(nonatomic,strong)NSMutableArray * rowColorArray;



//点击其中元素
-(void)clickedItemIndex:(NSInteger)index;


@end