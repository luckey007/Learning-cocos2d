//
//  CCDrawUtils.h
//  Crispy
//
//  Created by Harsh Jain on 3/30/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CCDrawNode (Ext)

-(void)drawRectangle:(CGRect)r fillColor:(ccColor4F)fill borderWidth:(CGFloat)width borderColor:(ccColor4F)line;
-(void)drawArcAtCenter:(CGPoint)o radius:(CGFloat)r width:(CGFloat)w startAngle:(CGFloat)sa endAngle:(CGFloat)ea segments:(int)segs color:(ccColor4F)color;

@end
