//
//  CPUISupport.h
//  Crispy
//
//  Created by Harsh Jain on 5/22/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CPLabelStyle;
@class CPButtonStyle;
@class CPPopupStyle;

@protocol CPUISupport <NSObject>

-(CPLabelStyle*)labelStyle:(int)fontSize;
-(CPButtonStyle*)buttonStyle:(int)fontSize;
-(CPPopupStyle*)popupStyle;

@end
