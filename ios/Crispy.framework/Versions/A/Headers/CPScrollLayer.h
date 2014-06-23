//
//  CPScrollLayer.h
//  sketch
//
//  Created by Kiran Bhivgade on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

enum CPScrollDirection {
    kCPScrollDirectionX,
    kCPScrollDirectionY
};

@interface CPScrollLayer : CCLayer<UIGestureRecognizerDelegate> {
    enum CPScrollDirection direction;
    
    UIPanGestureRecognizer *panRecognizer;
    
    CGFloat min;
    CGFloat max;
    
    CGPoint positionBeforePanning;
    
    CGFloat acceleration;
    CGRect area;
}

@property(nonatomic, assign) CGRect area;

-(id)initWithDirection:(enum CPScrollDirection)d;
-(void)computeMinMax;

@end
