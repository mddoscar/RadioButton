//
//  RadioButtonView.m
//  onemapsupermap
//
//  Created by 月光 on 15/7/3.
//  Copyright (c) 2015年 月光. All rights reserved.
//

#import "RadioButtonView.h"

//引用oc 运行时
#import <objc/runtime.h>
@implementation UITableViewCell (FixUITableViewCellAutolayoutIHope)

+ (void)load
{
    Method existing = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method new = class_getInstanceMethod(self, @selector(_autolayout_replacementLayoutSubviews));

    method_exchangeImplementations(existing, new);
}

- (void)_autolayout_replacementLayoutSubviews
{
    [super layoutSubviews];
    [self _autolayout_replacementLayoutSubviews]; // not recursive due to method swizzling
    [super layoutSubviews];
}

@end

@implementation RadioButtonView
@synthesize  mRadioButtonData=mData;
@synthesize  target=targer;
@synthesize action=action;


- (id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}
-(void)  setMRadioButtonData:(RadioButtonData *)mRadioButtonData
{
    if (mRadioButtonData) {
        //持久化数据
        mData=mRadioButtonData;
        //各种赋值
        if (nil!=mRadioButtonData.mSubjectText) {
            self.mUISubjectLabel.text=mRadioButtonData.mSubjectText;
        }
        //根据状态设置图片
        [self setStateImage];
    }
    
}
-(void) setStateImage
{
    
    [self setStateImage:mData.mIsSelected];
}

-(void) setStateImage:(BOOL)pState
{
    
    if (pState) {
        self.mUICheckImageView.image=[UIImage imageNamed:mData.mSelectedImage];
    }else if(!pState)
    {
        self.mUICheckImageView.image=[UIImage imageNamed:mData.mUnselectImage];
    }
    
}

//添加点击事件
-(void) addTarget:(id)pTarget action:(SEL)pAction
{
    self.target=pTarget;
    self.action=pAction;
}

//赋值
-(void) setCurrentValue:(BOOL) value
{
    
    [mData setMIsSelected:value];
    [self setStateImage];
    
}
-(void) setCurrentStringValue:(NSString *)value
{
    [mData setMIsSelected:[value isEqualToString:@"YES"]];
    [self setStateImage];
    
}
-(void) setCurrentNumberValue:(int)value
{
    BOOL ToValue=NO;
    if (value==1) {
        ToValue=YES;
    }
    else if(value==0)
    {
        ToValue=NO;
    }
    [mData setMIsSelected:ToValue];
    [self setStateImage];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //    //NSLog(@"Data:%@",mData.description);
    [UIView animateWithDuration:0.5 animations:^{
        //动画特效
    } completion:^(BOOL finished) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        NSLog(@"控件编号:%@",mData.mUnitId);
        [self.target performSelector:self.action withObject:self];
#pragma clang diagnostic pop
    }];
    
    //nil???
    //NSLog(@"结束点击:%@",self.mUIHideValueLabel.text);
    BOOL value=[self getCurrentValue];
    //设置相反数
    [self setCurrentValue:!value];
}
-(BOOL) getCurrentValue{
    return  [mData mIsSelected];
}

-(NSString *) getCurrentStringValue
{
    NSString * result=[NSString string];
    result =[mData mIsSelected]?@"YES":@"NO";
    return result;
    //    result =[self.mCheckBoxViewData mCheckValue]?@"YES":@"NO";
}
-(int) getCurrentNumberValue
{
    int result;
    result=[mData mIsSelected]?1:0;
    return result;
    //result=[self.mCheckBoxViewData mCheckValue]?1:0;
}
-(NSString *) getCurrentNumberStringValue
{
    NSString * result=[NSString string];
    //result =[self.mCheckBoxViewData mCheckValue]?@"1":@"0";
    result =[mData mIsSelected]?@"1":@"0";
    return result;
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

