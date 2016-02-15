//
//  RadioButtonData.h
//  onemapsupermap
//
//  Created by 月光 on 15/7/3.
//  Copyright (c) 2015年 月光. All rights reserved.
//

#import <Foundation/Foundation.h>

//单选按钮数据
@interface RadioButtonData : NSObject

#pragma  mark 控件属性
@property (nonatomic ,copy) NSString * mUnitId;

#pragma mark 控件描述
//标题
@property (nonatomic ,copy) NSString * mSubjectText;
//选中图片
@property (nonatomic ,copy) NSString * mSelectedImage;
//未选中图片
@property (nonatomic ,copy) NSString * mUnselectImage;
#pragma  mark 主要控件
//是否选中
@property (nonatomic ,assign) BOOL mIsSelected;


#pragma  mark 初始化方法
-(id) initWithData:(NSString *) pUnitId mSubjectText:(NSString *) pSubjectText mSelectedImage:(NSString *) pSelectedImage mUnselectImage:(NSString *) pUnselectImage mIsSelected:(BOOL) pIsSelected;
-(id) initWithData:(NSString *) pUnitId mSubjectText:(NSString *) pSubjectText mIsSelected:(BOOL) pIsSelected;
-(id) initWithData:(NSString *) pUnitId mSelectedImage:(NSString *) pSelectedImage mUnselectImage:(NSString *) pUnselectImage mIsSelected:(BOOL) pIsSelected;
-(id) initWithData:(NSString *) pUnitId mIsSelected:(BOOL) pIsSelected;

#pragma  mark 描述

-(NSString *) description;


@end
