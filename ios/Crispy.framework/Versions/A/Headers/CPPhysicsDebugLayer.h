//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"

class GLESDebugDraw;

@interface CPPhysicsDebugLayer : CCLayer {
    b2World *_world;
    GLESDebugDraw* m_debugDraw;
}

-(id)initWithWorld:(b2World*)w;

@end

