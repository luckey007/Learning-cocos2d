//
//  GameScene.h
//  PomaDroid
//
//  Created by Lucky Lakhwani on 18/04/14.
//  Copyright 2014 Lucky Lakhwani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameLayer.h"
#import "HudLayer.h"


@interface GameScene : CCNode {
    
}

@property(nonatomic)GameLayer   *gameLayer;
@property(nonatomic)HudLayer    *hudLayer;

@end
