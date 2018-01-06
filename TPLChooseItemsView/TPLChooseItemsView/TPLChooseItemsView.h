//
//  IFChooseItemsView.h
//  MaMaShoppingPro
//
//  Created by 谭鄱仑 on 14-9-18.
//  Copyright (c) 2014年 谭鄱仑. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChooseItem : UIImageView

//携带的信息
@property(nonatomic,strong)NSDictionary * info;

@property(nonatomic,strong)UILabel * textLabel;
@property(nonatomic,assign)BOOL isChoose;

-(void)tapOne:(UITapGestureRecognizer * )tapOne;


@end




@interface TPLChooseItemsView : UIImageView
@property(nonatomic,strong)NSArray   * titleArray;
//图片,本地图片和URL
@property(nonatomic,strong)NSArray * backImagesArray;
@property(nonatomic,readonly)NSArray * chooseArray;
@property(nonatomic,readonly)NSArray * itemArray;
//携带信息数组，方便数据多样性
@property(nonatomic,strong)NSArray * infoArray;
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
//@property(nonatomic,assign)CGFloat itemHorizontalMargin;
@property(nonatomic,assign)CGFloat itemHorizontalLeftMargin;
@property(nonatomic,assign)CGFloat itemHorizontalRightMargin;



@property(nonatomic,assign)CGFloat horizontalMargin;
@property(nonatomic,assign)CGFloat vertaicalMargin;
@property(nonatomic,assign)CGFloat xSpace;
@property(nonatomic,assign)CGFloat ySpace;


//标签颜色数组
@property(nonatomic,strong)NSMutableArray * rowColorArray;

//是否只是用于展示，默认为NO
@property(nonatomic,assign)BOOL justShow;


//点击事件
@property(nonatomic,copy)void (^clickedChooseItem)(TPLChooseItemsView * chooseView,ChooseItem * item);
///必须要有
@property(nonatomic,copy)void (^refresh)(TPLChooseItemsView * chooseView,ChooseItem * item);



//点击其中元素
-(void)clickedItemIndex:(NSInteger)index;

//配置完后刷新
-(void)refreshView;


@end
