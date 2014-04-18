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
        [self scheduleUpdate];
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

-(void)simpleDPad:(SimpleDPad *)simpleDPad didChangeDirectionTo:(CGPoint)direction {
    [hero walkWithDirection:direction];
}

-(void)simpleDPadTouchEnded:(SimpleDPad *)simpleDPad {
    if (hero.actionState == kActionStateWalk) {
        [hero idle];
    }
}

-(void)simpleDPad:(SimpleDPad *)simpleDPad isHoldingDirection:(CGPoint)direction {
    [hero walkWithDirection:direction];
}

-(void)dealloc {
    [self unscheduleUpdate];
}

-(void)update:(ccTime)dt {
    [hero update:dt];
    [self updatePositions];
    [self setViewpointCenter:hero.position];
}

-(void)updatePositions {
    float posX = MIN(tileMap.mapSize.width * tileMap.tileSize.width - hero.centerToSides, MAX(hero.centerToSides, hero.desiredPosition.x));
    float posY = MIN(3 * tileMap.tileSize.height + hero.centerToBottom, MAX(hero.centerToBottom, hero.desiredPosition.y));
    hero.position = ccp(posX, posY);
}

-(void)setViewpointCenter:(CGPoint) position {
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    int x = MAX(position.x, winSize.width / 2);
    int y = MAX(position.y, winSize.height / 2);
    x = MIN(x, (tileMap.mapSize.width * tileMap.tileSize.width)
            - winSize.width / 2);
    y = MIN(y, (tileMap.mapSize.height * tileMap.tileSize.height)
            - winSize.height/2);
    CGPoint actualPosition = ccp(x, y);
    
    CGPoint centerOfView = ccp(winSize.width/2, winSize.height/2);
    CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
    self.position = viewPoint;
}
@end
