//
//  MyCocos2DClass.m
//  PomaDroid
//
//  Created by Lucky Lakhwani on 18/04/14.
//  Copyright 2014 Lucky Lakhwani. All rights reserved.
//

#import "GameLayer.h"


@implementation GameLayer

-(id) init{
    if (self == [super init]) {
        [self initTileMap];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"pd_sprites.plist"];
        actors = [CCSpriteBatchNode batchNodeWithFile:@"pd_sprites.pvr.ccz"];
        [actors.texture setAliasTexParameters];
        [self addChild:actors z:-5];
        [self initHero];
        
        self.touchEnabled = YES;
    }
    return self;
}

-(void) initTileMap{
    
    tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"pd_tilemap.tmx"];
    for (CCTMXLayer *child in [tileMap children]) {
        [[child texture] setAliasTexParameters];
    }
    [self addChild:tileMap z:-6];
}

-(void) initHero{
    
    hero = [Hero node];
    [actors addChild:hero];
    hero.position = ccp(hero.centerToSides, 80);
    hero.desiredPosition = hero.position;
    [hero idle];
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [hero attack];
}

@end
