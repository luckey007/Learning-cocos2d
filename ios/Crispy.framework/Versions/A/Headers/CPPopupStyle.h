//
//  CPPopupStyle.h
//  Crispy
//
//  Created by Harsh Jain on 5/13/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CPLabelStyle;
@class CPButtonStyle;

@interface CPPopupStyle : NSObject {
    CPLabelStyle *_titleStyle;
    CPLabelStyle *_messageStyle;
    CPButtonStyle *_cancelStyle;
    CPButtonStyle *_okStyle;

    NSString *_backgroundImage;
    CGRect _backgroundNinePatch;
    
    NSString *_titleImage;
    CGRect _titleNinePatch;
    
    NSString *_messageImage;
    CGRect _messageNinePatch;
    
    CGFloat _titlePadding;
    CGFloat _messagePadding;
    CGFloat _overallPadding;
    CGFloat _titleMessageSpacing;
    
    CGFloat _minWidth;
    CGFloat _maxWidth;
    CGFloat _minHeight;
    CGFloat _maxHeight;
}

+(id)style;

@property(nonatomic, retain) CPLabelStyle *titleStyle;
@property(nonatomic, retain) CPLabelStyle *messageStyle;
@property(nonatomic, retain) CPButtonStyle *cancelStyle;
@property(nonatomic, retain) CPButtonStyle *okStyle;

@property(nonatomic, retain) NSString *backgroundImage;
@property(nonatomic, assign) CGRect backgroundNinePatch;

@property(nonatomic, retain) NSString *titleImage;
@property(nonatomic, assign) CGRect titleNinePatch;

@property(nonatomic, retain) NSString *messageImage;
@property(nonatomic, assign) CGRect messageNinePatch;

@property(nonatomic, assign) CGFloat titlePadding;
@property(nonatomic, assign) CGFloat messagePadding;
@property(nonatomic, assign) CGFloat overallPadding;
@property(nonatomic, assign) CGFloat titleMessageSpacing;

@property(nonatomic, assign) CGFloat minWidth;
@property(nonatomic, assign) CGFloat minHeight;
@property(nonatomic, assign) CGFloat maxWidth;
@property(nonatomic, assign) CGFloat maxHeight;

@end
