//
//  MyCocos2DClass.m
//  PomaDroid
//
//  Created by Lucky Lakhwani on 18/04/14.
//  Copyright 2014 Lucky Lakhwani. All rights reserved.
//

#import "GameLayer.h"
#import "Robots.h"

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
        [self initRobots];
        
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

-(void)initRobots
{
    int robotCount = 50;
    self.robots = [[CCArray alloc] initWithCapacity:robotCount];
    
    for (int i = 0; i < robotCount; i++)
    {
        Robots *robot = [Robots node];
        [actors addChild:robot];
        [_robots addObject:robot];
        
        int minX = SCREEN.width + robot.centerToSides;
        int maxX = tileMap.mapSize.width * tileMap.tileSize.width - robot.centerToSides;
        int minY = robot.centerToBottom;
        int maxY = 3 * tileMap.tileSize.height + robot.centerToBottom;
        robot.scaleX = -1;
        robot.position = ccp(random_range(minX, maxX), random_range(minY, maxY));
        robot.desiredPosition = robot.position;
        [robot idle];
    }
}



-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [hero attack];
    if (hero.actionState == kActionStateAttack) {
        Robots *robot;
        CCARRAY_FOREACH(_robots, robot) {
            if (robot.actionState != kActionStateKnockedOut) {
                if (fabsf(hero.position.y - robot.position.y) < 10) {
                    if (CGRectIntersectsRect(hero.attackBox.actual, robot.hitBox.actual)) {
                        [robot hurtWithDamage:hero.damage];
                    }
                }
            }
        }
    }
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
    [self reorderActors];
    
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

-(void)reorderActors {
    ActionSprite *sprite;
    CCARRAY_FOREACH(actors.children, sprite) {
        [actors reorderChild:sprite z:(tileMap.mapSize.height * tileMap.tileSize.height) - sprite.position.y];
    }
}




@end
