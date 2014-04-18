//
//  SimpleDPad.h
//  PomaDroid
//
//  Created by Lucky Lakhwani on 18/04/14.
//  Copyright 2014 Lucky Lakhwani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class SimpleDPad;

@protocol SimpleDPadDelegate <NSObject>

-(void)simpleDPad:(SimpleDPad *)simpleDPad didChangeDirectionTo:(CGPoint)direction;
-(void)simpleDPad:(SimpleDPad *)simpleDPad isHoldingDirection:(CGPoint)direction;
-(void)simpleDPadTouchEnded:(SimpleDPad *)simpleDPad;

@end

@interface SimpleDPad : CCSprite <CCTouchDelegate> {
    CGPoint _direction;
    float _radius;
}

@property(nonatomic)id <SimpleDPadDelegate> delegate;
@property(nonatomic,assign)BOOL isHeld;

+(id)dPadWithFile:(NSString *)fileName radius:(float)radius;
-(id)initWithFile:(NSString *)filename radius:(float)radius;

@end
