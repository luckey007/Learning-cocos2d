//
//  CPButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

enum CPButtonState {
    CPButtonTouchStart=0,
    CPButtonTouchEnd=1,
    CPButtonTouchCancelled=2
};

@class CPButton;
@class CPLabel;
@class CPButtonStyle;

@interface CPButton : CCNode<CCTouchOneByOneDelegate> {
    SEL callback;
    id target;
    id _data;
    
    CCNode<CCRGBAProtocol> *normal;
    CCNode *clickedNode;
    CCNode *checkedNode;
    CCNode *disabledNode;
    
    CPLabel *label;
    
    BOOL _enabled;
    BOOL _checked;
    
    int numArgs;

    NSString *_string;
    CPButtonStyle *_style;
}

@property(nonatomic, retain) id data;
@property(nonatomic, assign) BOOL enabled;
@property(nonatomic, assign) BOOL checked;
@property(nonatomic, assign) BOOL flipX;
@property(nonatomic, assign) BOOL flipY;
@property(nonatomic, retain) NSString *string;
@property(nonatomic, readonly) CPLabel *label;

+(CPButton*)buttonWithStyle:(CPButtonStyle*)style;
+(CPButton*)buttonWithStyle:(CPButtonStyle*)style text:(NSString*)text;
+(CPButton*)buttonWithNormal:(NSString*)image clicked:(NSString*)clicked;
+(CPButton*)buttonWithNormal:(NSString*)image touchOpacity:(GLubyte)touchOpacity;

-(id)initWithStyle:(CPButtonStyle*)style text:(NSString*)text;

/**
 * btnClicked;
 * btnClicked:(int)st data:(id)data;
 */
-(void)setCallback:(SEL)cb target:(id)t;

@end

