//
//  ViewController.m
//  XBNormalSetting
//
//  Created by 许鑫博 on 2018/9/28.
//  Copyright © 2018年 XXB. All rights reserved.
//

#import "ViewController.h"
#import "XBNormalSettingCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSArray <NSArray <XBNormalSettingItem *>*>* settingItemArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    //设置tableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.backgroundColor = self.view.backgroundColor;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[XBNormalSettingCell class] forCellReuseIdentifier:XBNormalSettingCellReuseID];
    self.tableView.separatorStyle = NO;
    [self.view addSubview:_tableView];
    
    //类型1
    XBNormalSettingItem *item_1 = [[XBNormalSettingItem alloc] initWithTitle:@"类型1_标题" detail:@"类型1_副标题"];
    item_1.settingItemClicked = ^(XBNormalSettingItem * _Nonnull item) {
        NSLog(@"点击了 %@",item.titleString);
    };
    item_1.isTopSeparator = YES;
    item_1.topSeparatorSpace = 0;
    
    //类型2
    XBNormalSettingItem *item_2 = [[XBNormalSettingItem alloc] initWithTitle:@"类型2_标题" detail:@"类型2_副标题"];
    item_2.leftImage = [UIImage imageNamed:@"item_2"];
    item_2.settingItemClicked = ^(XBNormalSettingItem * _Nonnull item) {
        NSLog(@"点击了 %@",item.titleString);
    };
    
    //类型3
    UIButton *itemBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [itemBtn setImage:[UIImage imageNamed:@"item_3"] forState:UIControlStateNormal];
    XBNormalSettingItem *item_3 = [[XBNormalSettingItem alloc] initWithTitle:@"类型3_标题" detail:@"类型3_副标题"];
    item_3.hintBtn = itemBtn;
    item_3.settingItemClicked = ^(XBNormalSettingItem * _Nonnull item) {
        NSLog(@"点击了 %@",item.titleString);
    };
    item_3.hintBtnClicked = ^{
        NSLog(@"点击了 提示按钮");
    };
    
    //类型4
    UIImageView *itemImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"item_4"]];
    itemImageView.frame = CGRectMake(0, 0, 40, 40);
    XBNormalSettingItem *item_4 = [[XBNormalSettingItem alloc] initWithTitle:@"类型4_标题" detail:@"类型4_副标题"];
    item_4.rightIconView = itemImageView;
    item_4.settingItemClicked = ^(XBNormalSettingItem * _Nonnull item) {
        NSLog(@"点击了 %@",item.titleString);
    };
    item_4.isBottomSeparator = 0;
    
    //带UISwitch控件类型
    XBNormalSettingItem *item_5 = [[XBNormalSettingItem alloc] initWithTitle:@"带UISwitch控件类型" detail:@""];
    item_5.accessoryControl = [UISwitch new];
    [(UISwitch *)item_5.accessoryControl setOn:YES]; //可以这样直接获取控件
    item_5.settingItemClicked = ^(XBNormalSettingItem * _Nonnull item) {
        NSLog(@"点击了 %@",item.titleString);
    };
    item_5.controlEvent = ^(XBNormalSettingItem * _Nonnull item) {
        //传入accessoryControl操作回调 这里因为是UISwitch 所以激活回调事件默认是 UIControlEventValueChanged
        NSString *string = ((UISwitch *)item.accessoryControl).isOn ? @"开启":@"关闭";
        NSLog(@"UISwitch %@",string);
    };
    item_5.isTopSeparator = YES;
    item_5.topSeparatorSpace = 0;
    
    //带UIButton控件类型
    UIButton *item6_Btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [item6_Btn setTitle:@"我是一个按钮" forState:UIControlStateNormal];
    item6_Btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [item6_Btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    item6_Btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    XBNormalSettingItem *item_6 = [[XBNormalSettingItem alloc] initWithTitle:@"带UIButton控件类型" detail:@""];
    item_6.accessoryControl = item6_Btn;
    item_6.settingItemClicked = ^(XBNormalSettingItem * _Nonnull item) {
        NSLog(@"点击了 %@",item.titleString);
    };
    item_6.controlEvent = ^(XBNormalSettingItem * _Nonnull item) {
        //传入accessoryControl操作回调 这里因为是UIButton 所以激活回调事件默认是 UIControlEventTouchUpInsides
        NSLog(@"点击了 我是一个按钮");
    };
    
    //带UISlider控件类型
    UISlider *slider = [UISlider new];
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.w = 100;
    XBNormalSettingItem *item_7 = [[XBNormalSettingItem alloc] initWithTitle:@"带UISlider控件类型" detail:@""];
    item_7.accessoryControl = slider;
    //除UIButton与UISwitch控件外,其他控件必须传accessoryControlEvent回调,否则无法收到回调
    item_7.accessoryControlEvent = UIControlEventValueChanged;
    item_7.settingItemClicked = ^(XBNormalSettingItem * _Nonnull item) {
        NSLog(@"点击了 %@",item.titleString);
    };
    item_7.controlEvent = ^(XBNormalSettingItem * _Nonnull item) {
        NSLog(@"slider = %.f",((UISlider *)item.accessoryControl).value);
    };
    item_7.bottomSeparatorSpace = 0;
    
    //普通类型 大标题
    XBNormalSettingItem *item_8 = [[XBNormalSettingItem alloc] initWithTitle:@"大标题" detail:@""];
    item_8.height = 80;
    item_8.accessoryType = UITableViewCellAccessoryNone;
    item_8.title = [[NSAttributedString alloc] initWithString:item_8.titleString attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor orangeColor]}];
    item_8.settingItemClicked = ^(XBNormalSettingItem * _Nonnull item) {
        NSLog(@"点击了 %@",item.titleString);
    };
    item_8.isTopSeparator = YES;
    item_8.topSeparatorSpace = 0;
    
    //普通类型 中标题
    XBNormalSettingItem *item_9 = [[XBNormalSettingItem alloc] initWithTitle:@"中标题" detail:@""];
    item_9.height = 70;
    item_9.itemLeading = 16;
    item_9.accessoryType = UITableViewCellAccessoryNone;
    item_9.title = [[NSAttributedString alloc] initWithString:item_9.titleString attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor redColor]}];
    item_9.settingItemClicked = ^(XBNormalSettingItem * _Nonnull item) {
        NSLog(@"点击了 %@",item.titleString);
    };
    
    //普通类型 小标题
    XBNormalSettingItem *item_10 = [[XBNormalSettingItem alloc] initWithTitle:@"小标题" detail:@""];
    item_10.height = 60;
    item_10.itemLeading = 20;
    item_10.accessoryType = UITableViewCellAccessoryNone;
    item_10.title = [[NSAttributedString alloc] initWithString:item_10.titleString attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor greenColor]}];
    item_10.settingItemClicked = ^(XBNormalSettingItem * _Nonnull item) {
        NSLog(@"点击了 %@",item.titleString);
    };
    item_10.bottomSeparatorSpace = 0;

    //加入数组,刷新tableView
    _settingItemArray = @[@[item_1,item_2,item_3,item_4],
                          @[item_5,item_6,item_7],
                          @[item_8,item_9,item_10]];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _settingItemArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _settingItemArray[section].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XBNormalSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:XBNormalSettingCellReuseID];
    cell.item = _settingItemArray[indexPath.section][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _settingItemArray[indexPath.section][indexPath.row].height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section==0?CGFLOAT_MIN:9.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = self.view.backgroundColor;
    return view;
}

@end
