//
//  XBNormalSettingItem.m
//  XBNormalSetting
//
//  Created by 许鑫博 on 2018/9/28.
//  Copyright © 2018年 XXB. All rights reserved.
//

#define DefaultLeading 12.0
#define DefaultTrailing 12.0
#define DefaultTitlefontSize 15
#define DefaultDetailfontSize 15
#define DefaultItemCellHeight 60.0
#define DefaultSeparatorSpace 12.0
#define DefaultSeparatorH 1
#define DefaultSeparatorcColor [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1.0]
#define DefaultTitleColor  [UIColor colorWithRed:16.0/255.0 green:16.0/255.0 blue:16.0/255.0 alpha:1.0]
#define DefaultDetailColor [UIColor colorWithRed:116.0/255.0 green:116.0/255.0 blue:116.0/255.0 alpha:1.0]


#import "XBNormalSettingItem.h"
@implementation XBNormalSettingItem
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _height = DefaultItemCellHeight;
        _isTopSeparator = NO;
        _isBottomSeparator = YES;
        _topSeparatorSpace = DefaultSeparatorSpace;
        _bottomSeparatorSpace = DefaultSeparatorSpace;
        _topSeparatorH = DefaultSeparatorH;
        _bottomSeparatorH = DefaultSeparatorH;
        _topSeparatorcColor = DefaultSeparatorcColor;
        _bottomSeparatorcColor = DefaultSeparatorcColor;
        _itemLeading = DefaultLeading;
//        _itemTrailing = DefaultTrailing;
    }
    return self;
}
-(instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail
{
    if (self = [self init])
    {
        self.titleString = title;
        self.detailString = detail;
    }
    return self;
}

-(void)setTitleString:(NSString *)titleString
{
    if (!titleString.length)titleString = @"";
    _title = [[NSAttributedString alloc]initWithString:titleString attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:DefaultTitlefontSize],NSForegroundColorAttributeName:DefaultTitleColor}];
    
}

-(NSString *)titleString
{
    return _title.string;
}

-(void)setDetailString:(NSString *)detailString
{
    if (!detailString.length)detailString = @"";
    _detail = [[NSAttributedString alloc]initWithString:detailString attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:DefaultDetailfontSize],NSForegroundColorAttributeName:DefaultDetailColor}];
}

-(NSString *)detailString
{
    return _detail.string;
}

-(void)setRightIconView:(UIImageView *)rightIconView{
    _rightIconView = rightIconView;
    _rightIconView.contentMode = UIViewContentModeScaleAspectFill;
    _rightIconView.clipsToBounds = YES;
}

@end
