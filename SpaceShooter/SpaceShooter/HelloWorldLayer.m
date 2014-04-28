//
//  HelloWorldLayer.m
//  SpaceShooter
//
//  Created by Lucky Lakhwani on 28/04/14.
//  Copyright Lucky Lakhwani 2014. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
    if( (self=[super init])) {
        
        batchNode = [CCSpriteBatchNode batchNodeWithFile:@"Sprites.pvr.ccz"]; // 1
        [self addChild:batchNode]; // 2
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Sprites.plist"]; // 3
        
        ship = [CCSprite spriteWithSpriteFrameName:@"SpaceFlier_sm_1.png"];  // 4
        CGSize winSize = [CCDirector sharedDirector].winSize; // 5
        ship.position = ccp(winSize.width * 0.1, winSize.height * 0.5); // 6
        [batchNode addChild:ship z:1]; // 7
        
        backgroundNode = [CCParallaxNode node];
        [self addChild:backgroundNode z:-1];
        
        spacedust1 = [CCSprite spriteWithFile:@"bg_front_spacedust.png"];
        spacedust2 = [CCSprite spriteWithFile:@"bg_front_spacedust.png"];
        planetsunrise = [CCSprite spriteWithFile:@"bg_planetsunrise.png"];
        galaxy = [CCSprite spriteWithFile:@"bg_galaxy.png"];
        spacialanomaly = [CCSprite spriteWithFile:@"bg_spacialanomaly.png"];
        spacialanomaly2 = [CCSprite spriteWithFile:@"bg_spacialanomaly2.png"];
        
        CGPoint dustSpeed = ccp(0.1, 0.1);
        CGPoint bgSpeed = ccp(0.05, 0.05);
        
        [backgroundNode addChild:spacedust1 z:0 parallaxRatio:dustSpeed positionOffset:ccp(0,winSize.height/2)];
        [backgroundNode addChild:spacedust2 z:0 parallaxRatio:dustSpeed positionOffset:ccp( spacedust1.contentSize.width,winSize.height/2)];
        [backgroundNode addChild:galaxy z:-1 parallaxRatio:bgSpeed positionOffset:ccp(0,winSize.height * 0.7)];
        [backgroundNode addChild:planetsunrise z:-1 parallaxRatio:bgSpeed positionOffset:ccp(600,winSize.height * 0)];
        [backgroundNode addChild:spacialanomaly z:-1 parallaxRatio:bgSpeed positionOffset:ccp(900,winSize.height * 0.3)];
        [backgroundNode addChild:spacialanomaly2 z:-1 parallaxRatio:bgSpeed positionOffset:ccp(1500,winSize.height * 0.9)];
        
        [self scheduleUpdate];
    }
    return self;
}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

- (void)update:(ccTime)dt {
    
    CGPoint backgroundScrollVel = ccp(-1000, 0);
    backgroundNode.position = ccpAdd(backgroundNode.position, ccpMult(backgroundScrollVel, dt));
    
}

@end
