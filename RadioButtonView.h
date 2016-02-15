//
//  RadioButtonView.h
//  onemapsupermap
//
//  Created by 月光 on 15/7/3.
//  Copyright (c) 2015年 月光. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButtonData.h"

@class RadioButtonData;
//单选按钮
@interface RadioButtonView : UIView
#pragma mark IB界面
@property (weak, nonatomic) IBOutlet UILabel *mUISubjectLabel;

@property (weak, nonatomic) IBOutlet UIImageView *mUICheckImageView;

#pragma  mark 数据
//在ARC下被提前release了
@property (nonatomic,strong) RadioButtonData * mRadioButtonData;
//点击相关
//标志
@property (nonatomic) id target;
//事件
@property (nonatomic) SEL action;

#pragma mark 点击事件
-(void) addTarget:(id)pTarget action:(SEL)pAction;

#pragma mark 一些方法


//设置
-(void) setCurrentValue:(BOOL) value;
-(void) setCurrentStringValue:(NSString *) value;
-(void) setCurrentNumberValue:(int) value;
//取值
-(BOOL) getCurrentValue;
//取字符串
-(NSString *)getCurrentStringValue;
//取数字
-(int)getCurrentNumberValue;
//取数字字符串
-(NSString *) getCurrentNumberStringValue;
@end
