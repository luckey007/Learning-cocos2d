//
//  GameScene.m
//  PomaDroid
//
//  Created by Lucky Lakhwani on 18/04/14.
//  Copyright 2014 Lucky Lakhwani. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

@synthesize gameLayer;
@synthesize hudLayer;

-(id) init{
    if (self == [super init]) {
        gameLayer = [GameLayer node];
        [self addChild:gameLayer z:0];
        hudLayer = [HudLayer node];
        [self addChild:hudLayer z:1];
    }
    return self;
}
@end
