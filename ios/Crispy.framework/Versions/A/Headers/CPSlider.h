//
//  CCSliderControl.h
//  AmericanTomato
//
//  Created by iroth on 1/5/11.
//  Copyright 2011 iRoth.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CPSlider;

@protocol CPSliderDelegate

-(void)slider:(CPSlider*)slider valueChanged:(int)value;

@end

@interface CPSlider : CCNode<CCTouchOneByOneDelegate> {
    int value;
	id<CPSliderDelegate> delegate;
	CGFloat minX;
	CGFloat maxX;
    
    int step;
    int rangeMin;
    int rangeMax;
    
    int paddingX;
    int paddingY;
    
}

-(id)initWithBg:(NSString*)bg
          thumb:(NSString*)thumb
            min:(int)rmin
            max:(int)rmax
           step:(int)st
       paddingX:(int)px
       paddingY:(int)py;
-(void)setMin:(int)rmin max:(int)rmax step:(int)st;

-(void)releaseTouch;
-(void)reset;

@property (nonatomic, assign) int value;
@property (nonatomic, retain) id<CPSliderDelegate> delegate;

@end
