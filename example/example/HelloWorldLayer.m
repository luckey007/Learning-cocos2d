//
//  HelloWorldLayer.m
//  example
//
//  Created by Lucky Lakhwani on 28/03/14.
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
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super initWithColor:ccc4(255, 255, 255, 255)]) ) {
		
        _monsters       = [[NSMutableArray alloc]init];
        _projectiles    = [[NSMutableArray alloc]init];
        
		CGSize size = [[CCDirector sharedDirector] winSize];
			
        CCSprite *ninja = [CCSprite spriteWithFile:@"player.png"];
        ninja.position = ccp(ninja.contentSize.width / 2, size.height / 2);
        [self addChild:ninja];
		
        [self schedule:@selector(gameLogic:) interval:1.0];
        [self schedule:@selector(update:)];

    
        [self setTouchEnabled:YES];

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
    
    [_monsters release];
    _monsters = nil;
    [_projectiles release];
    _projectiles = nil;
    
	[super dealloc];
}

- (void) addMonster {
    
    CCSprite * monster = [CCSprite spriteWithFile:@"monster.png"];
    
    // Determine where to spawn the monster along the Y axis
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int minY = monster.contentSize.height / 2;
    int maxY = winSize.height - monster.contentSize.height/2;
    int rangeY = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    
    // Create the monster slightly off-screen along the right edge,
    // and along a random position along the Y axis as calculated above
    monster.position = ccp(winSize.width + monster.contentSize.width/2, actualY);
    [self addChild:monster];
    
    monster.tag = 1;
    [_monsters addObject:monster];
    
    // Determine speed of the monster
    int minDuration = 2.0;
    int maxDuration = 4.0;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    // Create the actions
    CCMoveTo * actionMove = [CCMoveTo actionWithDuration:actualDuration
                                                position:ccp(-monster.contentSize.width/2, actualY)];
    CCCallBlockN * actionMoveDone = [CCCallBlockN actionWithBlock:^(CCNode *node) {
        [node removeFromParentAndCleanup:YES];
        CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO];
        [[CCDirector sharedDirector] replaceScene:gameOverScene];
         [_monsters removeObject:node];
    }];
   
    [monster runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
  
    
}


-(void)gameLogic:(ccTime)dt {
    [self addMonster];
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
 
    UITouch *touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace:touch];
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    CCSprite *projectile = [CCSprite spriteWithFile:@"projectile.png"];
    projectile.position = ccp(20, winSize.height/2);
    
    CGPoint offset = ccpSub(location, projectile.position);
    
    if (offset.x <= 0) return;
    
    [self addChild:projectile];
    
    projectile.tag = 2;
    [_projectiles addObject:projectile];
    
    int realX = winSize.width + (projectile.contentSize.width/2);
    float ratio = (float) offset.y / (float) offset.x;
    int realY = (realX * ratio) + projectile.position.y;
    CGPoint realDest = ccp(realX, realY);
    
    int offRealX = realX - projectile.position.x;
    int offRealY = realY - projectile.position.y;
    float length = sqrtf((offRealX*offRealX)+(offRealY*offRealY));
    float velocity = 480/1; // 480pixels/1sec
    float realMoveDuration = length/velocity;
    
    [projectile runAction:
     [CCSequence actions:
      [CCMoveTo actionWithDuration:realMoveDuration position:realDest],
      [CCCallBlockN actionWithBlock:^(CCNode *node) {
         [node removeFromParentAndCleanup:YES];
         [_projectiles removeObject:node];
     }],
      nil]];
}

- (void)update:(ccTime)dt {

    NSMutableArray *projectilesToDelete = [[NSMutableArray alloc]init];
    for (CCSprite *projectile in _projectiles) {
        
        NSMutableArray *monsterToDelete = [[NSMutableArray alloc]init];
        for (CCSprite *monster in _monsters) {
            
            if (CGRectIntersectsRect(projectile.boundingBox, monster.boundingBox)) {
                [monsterToDelete addObject:monster];
            }
        }
        
        for (CCSprite *monster in monsterToDelete) {
            [_monsters removeObject:monster];
            [self removeChild:monster cleanup:YES];
            monsterDestroyed++;
            if (monsterDestroyed > 30) {
                CCScene *gameOverScene = [GameOverLayer sceneWithWon:YES];
                [[CCDirector sharedDirector] replaceScene:gameOverScene];
            }
        }
        
        if (monsterToDelete.count > 0) {
            [projectilesToDelete addObject:projectile];
        }
        [monsterToDelete release];
    }
    
    for (CCSprite *projectile in projectilesToDelete) {
        [_projectiles removeObject:projectile];
        [self removeChild:projectile cleanup:YES];
    }
    [projectilesToDelete release];
}

@end
