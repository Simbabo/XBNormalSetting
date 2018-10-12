//
//  XBNormalSettingItem.h
//  XBNormalSetting
//
//  Created by 许鑫博 on 2018/9/28.
//  Copyright © 2018年 XXB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  为XBNormalSettingCell创建一个settingItem, 用于app一般设置界面
 *  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 *  ┃ title            detail  >┃
 *  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
 *  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 *  ┃ 🏞 title         detail  >┃
 *  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
 *  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 *  ┃ title 🖱         detail > ┃
 *  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
 *  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 *  ┃ title                 🏞 >┃
 *  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
 *  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 *  ┃ title            [control]┃
 *  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
 *  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
 *  ┃ title            detail > ┃
 *  ┃ title                     ┃
 *  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
 */

NS_ASSUME_NONNULL_BEGIN

@interface XBNormalSettingItem : NSObject

/**
 * titleSring和titleString 会始终被settingcell读取
 * 高度自定义可通过 title和details进行设置
 */
@property(nonatomic, strong)NSAttributedString *title;
@property(nonatomic, strong)NSAttributedString *detail;
@property(nonatomic)NSString *titleString;
@property(nonatomic)NSString *detailString;

/**
 * 副标题 
 */
@property(nonatomic, strong)NSAttributedString *subtitle;
@property(nonatomic)NSString *subtitleString;

/**
 * tableCell类型 默认:UITableViewCellAccessoryDisclosureIndicator
 */
@property(nonatomic, assign)UITableViewCellAccessoryType accessoryType;

/**
 * 左部缩进 默认:12
 */
@property(nonatomic, assign)CGFloat itemLeading;

///**
// * 右部缩进 默认:12 暂未实现
// */
//@property(nonatomic, assign)CGFloat itemTrailing;

/**
 * 左侧标志图片 默认为:nil
 */
@property(nonatomic,strong)UIImage *leftImage;

/**
 * title后面按钮 默认为:nil 可自行控制大小
 */
@property(nonatomic,strong)UIButton *hintBtn;

/**
 * hintBtn被点击的回调
 */
@property(nonatomic, copy)void(^hintBtnClicked)(void);

/**
 * 如果有值将在cell右侧添加此imageView显示 可以自行控制大小
 */
@property(nonatomic, strong)UIImageView *rightIconView;

/**
 * 顶部分割线
 *
 * isTopSeparator 是否显示顶部分割线 Default:NO
 * topSeparatorSpace 顶部分割线左边距 Default:12.0
 * topseparatorH 顶部分割线粗细 Default:1
 * topseparatorcColor 顶部分割线颜色 Default:r:243,g:243,b:243
 */
@property(nonatomic, assign)BOOL isTopSeparator;
@property(nonatomic, assign)CGFloat topSeparatorSpace;
@property(nonatomic, assign)CGFloat topSeparatorH;
@property(nonatomic, strong)UIColor *topSeparatorcColor;

/**
 * 底部分割线
 *
 * isBottomSeparator 是否显示底部分割线 Default:YES
 * bottomSeparatorSpace 底部分割线左边距 Default:12.0
 * bottomSeparatorH 底部分割线粗细 Default:1
 * bottomSeparatorcColor 底部分割线颜色 Default:r:243,g:243,b:243
 */
@property(nonatomic, assign)BOOL isBottomSeparator;
@property(nonatomic, assign)CGFloat bottomSeparatorSpace;
@property(nonatomic, assign)CGFloat bottomSeparatorH;
@property(nonatomic, strong)UIColor *bottomSeparatorcColor;


/**
 * 如果设置了accessoryControl,control将作为cell的accessoryView,
 * cell的accessoryType将为none
 * accessoryControl如果是UIButton和UISwitch,事件为UIControlEventTouchUpInside和
 * UIControlEventValueChanged
 * 其他control需要指定accessoryControlEvent
 */
@property(nonatomic, strong)UIControl *accessoryControl;
@property(nonatomic, assign)UIControlEvents accessoryControlEvent;

/**
 * settingCell的高 默认为:60.0
 */
@property(nonatomic, assign)CGFloat height;

/**
 * cell被点击的回调
 */
@property(nonatomic, copy)void(^settingItemClicked)(XBNormalSettingItem *item);

/**
 * accessoryControl的事件回调
 */
@property(nonatomic, copy)void(^controlEvent)(XBNormalSettingItem *item);


/**
 * 初始化一个 XBNormalSettingItem
 * @param title  默认字体为15,颜色为 DefaultTitleColor
 * @param detail 默认字体为16,颜色为 DefaultDetailColor
 * @return XBNormalSettingItem instance
 */
-(instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail;
@end
NS_ASSUME_NONNULL_END
