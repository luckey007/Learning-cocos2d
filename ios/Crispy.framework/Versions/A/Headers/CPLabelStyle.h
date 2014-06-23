//
//  CPLabelStyle.h
//  Crispy
//
//  Created by Harsh Jain on 5/7/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"



@interface CPLabelStyle : NSObject {
    NSString *_font;
    float _fontSize;
    BOOL _ttf;
    ccColor3B _color;
}

+(id)style;

@property(nonatomic, retain) NSString *font;
@property(nonatomic, assign) float fontSize;
@property(nonatomic, assign) BOOL ttf;
@property(nonatomic, assign) ccColor3B color;

@end
