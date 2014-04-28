//
//  HelloWorldLayer.h
//  SpaceShooter
//
//  Created by Lucky Lakhwani on 28/04/14.
//  Copyright Lucky Lakhwani 2014. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CCSpriteBatchNode *batchNode;
    CCSprite *ship;
    CCParallaxNode *backgroundNode;
    CCSprite *spacedust1;
    CCSprite *spacedust2;
    CCSprite *planetsunrise;
    CCSprite *galaxy;
    CCSprite *spacialanomaly;
    CCSprite *spacialanomaly2;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
