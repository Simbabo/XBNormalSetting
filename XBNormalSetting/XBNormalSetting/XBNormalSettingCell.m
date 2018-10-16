//
//  XBNormalSettingCell.m
//  XBNormalSetting
//
//  Created by 许鑫博 on 2018/9/28.
//  Copyright © 2018年 XXB. All rights reserved.
//

#import "XBNormalSettingCell.h"

@implementation XBNormalSettingCell
{
    UIButton *_btn;
    UIView *_bottomSeparatorV;
    UIView *_topSeparatorV;
    
    UILabel *_titleLeb;
    UILabel *_subTitleLeb;
    UIView *_customContentV;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    return [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
}
-(void)setItem:(XBNormalSettingItem *)item
{
    if (_item!=item) [_item.rightIconView removeFromSuperview];
    _item = item;
    
    if (_item.leftImage){
        self.imageView.image = _item.leftImage;
    }
    
    if (_item.subtitleString.length) {
        
        if (!_titleLeb) {
            _titleLeb = [UILabel new];
        }
        _titleLeb.attributedText = _item.title;
        [_titleLeb sizeToFit];
        
        if (!_subTitleLeb) {
            _subTitleLeb = [UILabel new];
        }
        _subTitleLeb.attributedText = _item.subtitle;
        _subTitleLeb.y = _titleLeb.h + 2.0;
        [_subTitleLeb sizeToFit];
        
        if (!_customContentV) {
            _customContentV = [UIView new];
            _customContentV.backgroundColor = [UIColor clearColor];
            [_customContentV addSubview:_titleLeb];
            [_customContentV addSubview:_subTitleLeb];
            [self.contentView addSubview:_customContentV];
        }
        _customContentV.h = _titleLeb.h + _subTitleLeb.h;
        _customContentV.w = self.w/2;
    }else{
        self.textLabel.attributedText = _item.title;
    }
    
    self.detailTextLabel.attributedText = _item.detail;
    
    
    if (_item.hintBtn) {
        _btn = _item.hintBtn;
        [_btn addTarget:self action:@selector(hintBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_btn];
    }
    
    self.accessoryView = nil;
    if(_item.accessoryControl)
    {
        self.accessoryView = _item.accessoryControl;
    }
    else if(item.accessoryType == UITableViewCellAccessoryDisclosureIndicator)
    {
        UIImageView *arrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"enter"]];
        [arrow sizeToFit];
        self.accessoryView = arrow;
    }
    if (_item.rightIconView)
    {
        
        [self.contentView addSubview:_item.rightIconView];
    }
    
    if (_item.accessoryControl)
    {
        UIControlEvents event = _item.accessoryControlEvent;
        if ([_item.accessoryControl isKindOfClass:[UIButton class]])
        {
            event = UIControlEventTouchUpInside;
        }
        if ([_item.accessoryControl isKindOfClass:[UISwitch class]])
        {
            event = UIControlEventValueChanged;
        }
        [_item.accessoryControl addTarget:self action:@selector(accessoryControlEvent) forControlEvents:event];
    }
    
    if (_item.isBottomSeparator) {
        if (!_bottomSeparatorV) {
            _bottomSeparatorV = [[UIView alloc] init];
            _bottomSeparatorV.backgroundColor = _item.bottomSeparatorcColor;
        }
        [self.contentView addSubview:_bottomSeparatorV];
    }
    
    if (_item.isTopSeparator) {
        if (!_topSeparatorV) {
            _topSeparatorV = [[UIView alloc] init];
            _topSeparatorV.backgroundColor = _item.topSeparatorcColor;
        }
        [self.contentView addSubview:_topSeparatorV];
    }
}

-(void)accessoryControlEvent
{
    if(_item.controlEvent) _item.controlEvent(_item);
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_item.leftImage)
    {
        self.imageView.x = _item.itemLeading;
        self.imageView.y = (self.contentView.h - self.imageView.h)*0.5;
    }
    if (_item.subtitleString.length) {
        _customContentV.x = CGRectGetMaxX(self.imageView.frame)+_item.itemLeading;
        _customContentV.cy = self.h/2;
    }else{
        self.textLabel.x = CGRectGetMaxX(self.imageView.frame)+_item.itemLeading;
    }
    if (_item.rightIconView)
    {
        _item.rightIconView.y = (self.contentView.h - _item.rightIconView.h)*0.5;
        _item.rightIconView.x = self.contentView.w - _item.itemLeading - _item.rightIconView.w;
        
        self.detailTextLabel.x = _item.rightIconView.x - _item.itemLeading - self.detailTextLabel.w;
    }
    if (_item.hintBtn) {
        _btn.x = self.textLabel.x + self.textLabel.w + _item.itemLeading;
        _btn.cy = self.textLabel.cy;
    }
    if (_item.isBottomSeparator) {
        _bottomSeparatorV.w = self.w - _item.bottomSeparatorSpace;
        _bottomSeparatorV.y = self.contentView.h - _item.bottomSeparatorH;
        _bottomSeparatorV.x = _item.bottomSeparatorSpace;
        _bottomSeparatorV.h = _item.bottomSeparatorH;
    }
    if (_item.isTopSeparator) {
        _topSeparatorV.w = self.w - _item.topSeparatorSpace;
        _topSeparatorV.y = 0;
        _topSeparatorV.x = _item.topSeparatorSpace;
        _topSeparatorV.h = _item.topSeparatorH;
    }
}

-(void)hintBtnClick:(UIButton *)btn{
    _item.hintBtnClicked();
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesCancelled:touches withEvent:event];
    if (_item.settingItemClicked)
    {
        _item.settingItemClicked(_item);
    }
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor whiteColor];
    }];
}


@end
