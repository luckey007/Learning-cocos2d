//
//  MyCocos2DClass.h
//  PomaDroid
//
//  Created by Lucky Lakhwani on 18/04/14.
//  Copyright 2014 Lucky Lakhwani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Hero.h"
#import "SimpleDPad.h"
#import "HudLayer.h"

@interface GameLayer : CCLayer<SimpleDPadDelegate> {
    
    CCTMXTiledMap       *tileMap;
    CCSpriteBatchNode   *actors;
    Hero                *hero;
}
@property(nonatomic)HudLayer *hud;

@end
