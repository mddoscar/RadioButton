//
//  RadioButtonData.m
//  onemapsupermap
//
//  Created by 月光 on 15/7/3.
//  Copyright (c) 2015年 月光. All rights reserved.
//

#import "RadioButtonData.h"

@implementation RadioButtonData

-(id) initWithData:(NSString *)pUnitId mSubjectText:(NSString *)pSubjectText mSelectedImage:(NSString *)pSelectedImage mUnselectImage:(NSString *)pUnselectImage mIsSelected:(BOOL)pIsSelected
{
    
    if(self=[super init])
    {
        self.mUnitId=pUnitId;
        self.mSubjectText=pSubjectText;
        self.mSelectedImage=pSelectedImage;
        self.mUnselectImage=pUnselectImage;
        self.mIsSelected=pIsSelected;
    }
    return  self;
}
-(id) initWithData:(NSString *)pUnitId mSubjectText:(NSString *)pSubjectText mIsSelected:(BOOL)pIsSelected
{
    if(self=[super init])
    {
        self.mUnitId=pUnitId;
        self.mSubjectText=pSubjectText;
        self.mSelectedImage=@"rb_selected";
        self.mUnselectImage=@"rb_unselected";
        self.mIsSelected=pIsSelected;
    }
    return  self;
}
-(id)initWithData:(NSString *)pUnitId mSelectedImage:(NSString *)pSelectedImage mUnselectImage:(NSString *)pUnselectImage mIsSelected:(BOOL)pIsSelected
{
    if(self=[super init])
    {
        self.mUnitId=pUnitId;
        self.mSelectedImage=pSelectedImage;
        self.mUnselectImage=pUnselectImage;
        self.mIsSelected=pIsSelected;
    }
    return  self;
}

-(id)initWithData:(NSString *)pUnitId mIsSelected:(BOOL)pIsSelected
{
    if(self=[super init])
    {
        self.mUnitId=pUnitId;
        self.mSelectedImage=@"rb_selected";
        self.mUnselectImage=@"rb_unselected";
        self.mIsSelected=pIsSelected;
    }
    return self;
}

-(NSString *)description
{
    NSString * result=nil;
    result=[NSString stringWithFormat:@"控件编号:%@,名称:%@,选中跟图片%@,未选中图片:%@,是否选中:%@",self.mUnitId,self.mSubjectText,self.mSelectedImage,self.mUnselectImage,self.mIsSelected?@"Yes":@"No"];
    return result;
    
}

@end
