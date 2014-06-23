//
//  CPButtonStyle.h
//  Crispy
//
//  Created by Harsh Jain on 5/7/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CPLabelStyle;

@interface CPButtonStyle : NSObject {
    CCSpriteBatchNode *_batch;
    CCSprite *_normalSprite;
    CCSprite *_clickedSprite;
    CCSprite *_disabledSprite;
    CCSprite *_checkedSprite;
    
    NSString *_normal;
    NSString *_clicked;
    NSString *_disabled;
    NSString *_checked;
    CGFloat _paddingLeft, _paddingTop, _paddingRight, _paddingBottom;
    GLubyte _touchOpacity;
    GLubyte _disabledOpacity;
    BOOL _ninePatch;
    BOOL _stretchX;
    BOOL _stretchY;
    NSString *_clickSound;
    CPLabelStyle *_labelStyle;
}

@property(nonatomic, retain) NSString *normal;
@property(nonatomic, retain) NSString *clicked;
@property(nonatomic, retain) NSString *checked;
@property(nonatomic, retain) NSString *disabled;
@property(nonatomic, assign) GLubyte touchOpacity;
@property(nonatomic, assign) GLubyte disabledOpacity;
@property(nonatomic, assign) BOOL ninePatch;
@property(nonatomic, retain) CPLabelStyle *labelStyle;
@property(nonatomic, retain) NSString *clickSound;
@property(nonatomic, assign) CGFloat paddingLeft;
@property(nonatomic, assign) CGFloat paddingRight;
@property(nonatomic, assign) CGFloat paddingTop;
@property(nonatomic, assign) CGFloat paddingBottom;
@property(nonatomic, retain) CCSprite *normalSprite;
@property(nonatomic, retain) CCSprite *clickedSprite;
@property(nonatomic, retain) CCSprite *checkedSprite;
@property(nonatomic, retain) CCSprite *disabledSprite;
@property(nonatomic, retain) CCSpriteBatchNode *batch;
@property(nonatomic, assign) BOOL stretchX;
@property(nonatomic, assign) BOOL stretchY;

+(id)style;
+(id)styleWithStyle:(CPButtonStyle*)s;

-(void)setPaddingTop:(CGFloat)pTop
               right:(CGFloat)pRight
              bottom:(CGFloat)pBottom
                left:(CGFloat)pLeft;
-(void)setPadding:(CGFloat)p;
-(void)setPaddingX:(CGFloat)px
              andY:(CGFloat)py;

@end
