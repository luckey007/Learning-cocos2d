//
//  HelloWorldLayer.h
//  BouncingBalls
//
//  Created by Lucky Lakhwani on 23/06/14.
//  Copyright Lucky Lakhwani 2014. All rights reserved.
//


#import "cocos2d.h"
#import "Box2D.h"

#define PTM_RATIO 32.0

@interface HelloWorldLayer : CCLayer {
    
    b2World *world;
    b2Body  *body;
    CCSprite *ball;
}

+ (id) scene;

@end