//
//  IFChooseItemsView.m
//  MaMaShoppingPro
//
//  Created by 谭鄱仑 on 14-9-18.
//  Copyright (c) 2014年 谭鄱仑. All rights reserved.
//

#import "TPLChooseItemsView.h"

#define dealocInfo NSLog(@"%@ dealloc",[self class]);

@interface ChooseItem ()
@property(nonatomic,strong)void (^clicked)(ChooseItem * item);
@end


@implementation ChooseItem

-(void)dealloc
{
    dealocInfo
}


#pragma mark
#pragma mark           porperyt
#pragma mark

-(void)setIsChoose:(BOOL)isChoose
{
    _isChoose = isChoose;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        self.layer.backgroundColor = [UIColor whiteColor].CGColor;
//        self.textColor = [UIColor grayColor];
        self.userInteractionEnabled = YES;
        _isChoose = NO;
        
        
        self.layer.cornerRadius = 2.0f;//FitValue(5);
        self.clipsToBounds = YES;

        
        UITapGestureRecognizer * tapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOne:)];
        tapOne.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapOne];
        
        [self setUpSubviews];

    }
    return self;
}

- (void)setUpSubviews
{
    self.textLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.textLabel.backgroundColor = [UIColor blueColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.textLabel];
}



-(void)tapOne:(UITapGestureRecognizer * )tapOne
{
    _isChoose = !_isChoose;
    
    typeof(self) __weak weak_self = self;
    if(self.clicked) {
        self.clicked(weak_self);
    }
}
@end



@interface TPLChooseItemsView ()
{
    //data
    NSMutableArray * _itemArray;
}

@property(nonatomic,strong)ChooseItem * pastClickedItem;

@end

@implementation TPLChooseItemsView
@synthesize itemArray = _itemArray;
-(void)dealloc
{
    dealocInfo
}

#pragma mark
#pragma mark           porperty
#pragma mark
//-(void)setTitleArray:(NSArray *)titleArray
//{
//    _titleArray = titleArray;
//    [self refreshView];
//}

-(NSArray*)chooseArray
{
    NSMutableArray * chooseArray = [NSMutableArray arrayWithCapacity:0];
    for (ChooseItem * item in _itemArray)
    {
        if (item.isChoose)
        {
            [chooseArray addObject:item];
        }
    }
    return [chooseArray copy];
}

-(NSString*)chooseString
{
    NSMutableArray * chooseTextArray = [NSMutableArray arrayWithCapacity:0];
    for (ChooseItem * item in _itemArray)
    {
        if (item.isChoose)
        {
            [chooseTextArray addObject:item.textLabel.text];
        }
    }
    
    return [chooseTextArray componentsJoinedByString:@","];
}



//-(void)setItemHeight:(CGFloat)itemHeight
//{
//    _itemHeight = itemHeight;
//    [self refreshView];
//}
//
//-(void)setItemFont:(UIFont *)itemFont
//{
//    _itemFont = itemFont;
//    for (ChooseItem * item in _itemArray)
//    {
//        item.textLabel.font = itemFont;
//    }
//}
//
//-(void)setItemMixLength:(CGFloat)itemMixLength
//{
//    _itemMixLength = itemMixLength;
//    [self refreshView];
//}

//-(void)setItemHorizontalMargin:(CGFloat)itemHorizontalMargin
//{
//    _itemHorizontalMargin = itemHorizontalMargin;
//    [self refreshView];
//}
//
//-(void)setHorizontalMargin:(CGFloat)horizontalMargin
//{
//    _horizontalMargin = horizontalMargin;
//    [self refreshView];
//}
//
//-(void)setVertaicalMargin:(CGFloat)vertaicalMargin
//{
//    _vertaicalMargin = vertaicalMargin;
//    [self refreshView];
//}
//
//-(void)setXSpace:(CGFloat)xSpace
//{
//    _xSpace = xSpace;
//    [self refreshView];
//}
//
//-(void)setYSpace:(CGFloat)ySpace
//{
//    _ySpace = ySpace;
//    [self refreshView];
//}
//
//
//-(void)setRowColorArray:(NSMutableArray *)rowColorArray
//{
//    _rowColorArray = rowColorArray;
//    [self refreshView];
//}
//
//
//-(void)setIsFitLength:(BOOL)isFitLength
//{
//    _isFitLength = isFitLength;
//    [self refreshView];
//}
//
//-(void)setIsNeat:(BOOL)isNeat
//{
//    _isNeat = isNeat;
//    [self refreshView];
//}
//-(void)setIsMutableChoose:(BOOL)isMutableChoose
//{
//    _isMutableChoose = isMutableChoose;
//    [self refreshView];
//}
//
//-(void)setItemTextColor:(UIColor *)itemTextColor
//{
//    _itemTextColor = itemTextColor;
//    [self refreshView];
//}


#pragma mark
#pragma mark           init
#pragma mark
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        //init
        _titleArray = [[NSMutableArray alloc] initWithCapacity:0];
        _itemArray = [[NSMutableArray alloc] initWithCapacity:0];
        _rowColorArray = [@[[UIColor whiteColor]] mutableCopy];
        
        _itemHeight = 25;
        _itemWidth = 100;
        _itemMixLength = 70;
//        _itemHorizontalMargin = 12;
        _itemHorizontalLeftMargin = 12;
        _itemHorizontalRightMargin = 12;
        _horizontalMargin = 20;
        _vertaicalMargin = 10;
        _xSpace = 10;
        _ySpace = 20;
        
        _itemFont = [UIFont systemFontOfSize:12];
        _itemTextColor = [UIColor grayColor];
        
        _isFitLength = YES;
        _isNeat = YES;
        _isMutableChoose = YES;
        
    }
    return self;
}

#pragma mark
#pragma mark           help
#pragma mark


//点击其中元素
-(void)clickedItemIndex:(NSInteger)index
{
    [(ChooseItem*)[self.itemArray objectAtIndex:index] tapOne:nil];
}

//没有处理标题比比一行宽还要宽的情况
-(void)refreshView
{
    //清空之前的
    while (_itemArray.count > 0)
    {
        [_itemArray.lastObject removeFromSuperview];
        [_itemArray removeLastObject];
    }
    
    
    typeof(self) __weak weak_self = self;
    void (^clickedBlock)(ChooseItem * item) = ^(ChooseItem * item){
            //如果只是用于纯展示
        if (weak_self.justShow) {
            
        }else {
            if (!weak_self.isMutableChoose)
            {
                weak_self.pastClickedItem.isChoose = NO;
                weak_self.refresh(weak_self, weak_self.pastClickedItem);
            }
        }
        if(weak_self.refresh){
            weak_self.refresh(weak_self, item);
        }
        //点击对象
        if (weak_self.clickedChooseItem) {
            weak_self.clickedChooseItem(weak_self,item);
        }
        
        weak_self.pastClickedItem = item;
    };
    
    CGFloat rowHeight = _itemHeight;
    CGFloat x = _horizontalMargin;
    CGFloat y = _vertaicalMargin;
    CGFloat rowWidth = self.frame.size.width - _horizontalMargin*2;
    UIFont  * titleFont = _itemFont;
    CGFloat tempWidth = rowWidth;
    NSInteger colorPointer = 0;
    for (int i = 0; i < _titleArray.count; i++)
    {
        CGFloat itemWidth = [TPLChooseItemsView lengthOfString:[_titleArray objectAtIndex:i] withFont:titleFont];
        CGFloat textWidth = itemWidth;
        CGFloat itemHorizontalRightMargin = _itemHorizontalRightMargin;
        CGFloat itemHorizontalLeftMargin = _itemHorizontalLeftMargin;
        //如果小于最短长度，则扩大到最短长度
        itemWidth = itemWidth + itemHorizontalLeftMargin + itemHorizontalRightMargin > _itemMixLength ? itemWidth + itemHorizontalLeftMargin + itemHorizontalRightMargin : _itemMixLength;
        //如果不需要自适应长度
        if (!_isFitLength)
        {
            itemWidth = _itemWidth;
            itemHorizontalRightMargin = 0;
            itemHorizontalLeftMargin = 0;
            textWidth = itemWidth;
        }
        
        //处理是否能放得下
        if (itemWidth <= tempWidth)//能放下
        {
            ChooseItem * item = [[ChooseItem alloc] initWithFrame:CGRectMake(x, y, itemWidth, rowHeight)];
            item.textLabel.frame = CGRectMake(itemHorizontalLeftMargin, 0,textWidth ,rowHeight);
            item.clicked = clickedBlock;
            item.textLabel.textColor = _itemTextColor;
            item.textLabel.text = [_titleArray objectAtIndex:i];
            item.image = [UIImage imageNamed:[_backImagesArray objectAtIndex:i]];
            item.textLabel.font = _itemFont;
            [self addSubview:item];
            [_itemArray addObject:item];
            x = x + itemWidth + _xSpace;
            tempWidth = tempWidth - itemWidth - _xSpace;
            
            //如果是最后的元素，也要处理顶边
            if (i == _titleArray.count - 1)
            {
                //处理顶边
                [self dealHorizontalMarginWithTempWidth:tempWidth];
            }
            
            if(self.refresh){
                weak_self.refresh(weak_self, item);
            }
        }
        else//放不下
        {
            //处理顶边
            [self dealHorizontalMarginWithTempWidth:tempWidth];
            
            //换行
            x = _horizontalMargin;
            y = y + rowHeight + _ySpace;
            tempWidth = rowWidth;
            colorPointer++;
            if (colorPointer >= _rowColorArray.count)
            {
                colorPointer = 0;
            }
            
            //新行的Lable
            ChooseItem * item = [[ChooseItem alloc] initWithFrame:CGRectMake(x, y, itemWidth, rowHeight)];
            item.textLabel.frame = CGRectMake(itemHorizontalLeftMargin, 0,textWidth ,rowHeight);
            item.clicked = clickedBlock;
            item.textLabel.textColor = _itemTextColor;
            item.textLabel.font = _itemFont;
            item.textLabel.text = [_titleArray objectAtIndex:i];
            item.image = [UIImage imageNamed:[_backImagesArray objectAtIndex:i]];
            [self addSubview:item];
            [_itemArray addObject:item];
            x = x + itemWidth+ _xSpace;
            tempWidth = tempWidth - itemWidth - _xSpace;
            if(self.refresh){
                weak_self.refresh(weak_self, item);
            }
        }
    }
}



-(void)dealHorizontalMarginWithTempWidth:(CGFloat)tempWidth
{
    if (_isNeat)
    {
        //处理此行顶边
        //收集此行的Lable
        NSMutableArray * tempLabelArray = [NSMutableArray arrayWithCapacity:0];
        int rowItemIndex = (int)_itemArray.count - 1;
        UILabel * tempLabel = [_itemArray objectAtIndex:rowItemIndex];
        CGFloat tempY = tempLabel.frame.origin.y;
        while (tempLabel.frame.origin.y == tempY)
        {
            //NSLog(@"tempFrame %@",NSStringFromCGRect(tempLabel.frame));
            [tempLabelArray addObject:tempLabel];
            rowItemIndex--;
            if (rowItemIndex >= 0)
            {
                tempLabel = [_itemArray objectAtIndex:rowItemIndex];
            }
            else
            {
                break;
            }
        }
        //如果一行大于两个Lable，则需要调整顶边
        if (tempLabelArray.count > 0)
        {
            //处理收集到的Lable的位置
            CGFloat  offsetWidth= (tempWidth + _xSpace)/(tempLabelArray.count - 1);
            for (int i = (int)tempLabelArray.count - 2; i >= 0; i--)
            {
                ChooseItem * label = [tempLabelArray objectAtIndex:i];
                label.frame = (CGRect){{label.frame.origin.x + offsetWidth*(tempLabelArray.count - i - 1),label.frame.origin.y},label.frame.size};
            }
        }
    }
    
    
}


//获得字符串长度
#define MORE_WIDTH 0
+(CGFloat)lengthOfString:(NSString*)string withFont:(UIFont*)font
{
    NSString * systemString = [[UIDevice currentDevice] systemVersion];
    CGSize size;
    if ([systemString intValue] >= 7)
    {
        size = [string sizeWithAttributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName]];
    }
//    else
//    {
//        size = [string sizeWithFont:font];
//    }
    
    return size.width + MORE_WIDTH;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
