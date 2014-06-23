//
//  CPScrollLayer.h
//  sketch
//
//  Created by Kiran Bhivgade on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CPScrollLayer.h"

@interface CPListLayer : CPScrollLayer {
    CGFloat px;
    CGFloat py;
    CGFloat offset;
}

@property(nonatomic, assign) CGFloat offset;

-(id)initWithDirection:(enum CPScrollDirection)d paddingX:(CGFloat)px paddingY:(CGFloat)py;
-(void)redraw;

@end
