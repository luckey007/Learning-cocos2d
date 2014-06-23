//
//  CPCrackerLayer.h
//  casinoallin
//
//  Created by Harsh Jain on 10/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CPCrackerLayer : CCLayer {
    CCSprite *crackers[6];
    
    CGPoint points[6];
}

-(void)start:(CGFloat)time;

@end
