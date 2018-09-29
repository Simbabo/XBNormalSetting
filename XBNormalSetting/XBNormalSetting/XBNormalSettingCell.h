//
//  XBNormalSettingCell.h
//  XBNormalSetting
//
//  Created by 许鑫博 on 2018/9/28.
//  Copyright © 2018年 XXB. All rights reserved.
//
#define XBNormalSettingCellReuseID          @"XBNormalSettingCellReuseID"

#import <UIKit/UIKit.h>
#import "XBNormalSettingItem.h"
#import "UIView+Frame.h"
NS_ASSUME_NONNULL_BEGIN
@interface XBNormalSettingCell : UITableViewCell
@property(nonatomic, strong)XBNormalSettingItem *item;
@end
NS_ASSUME_NONNULL_END
