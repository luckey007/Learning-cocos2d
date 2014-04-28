//
//  HelloWorldLayer.m
//  TrigBlaster
//
//  Created by Lucky Lakhwani on 28/04/14.
//  Copyright Lucky Lakhwani 2014. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

const float MaxPlayerAccel = 400.0f;
const float MaxPlayerSpeed = 200.0f;

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer{
    
    CGSize winsize;
    CCSprite  *playerSprite;
    UIAccelerationValue accelerometerX;
    UIAccelerationValue accelerometerY;
    float _playerAccelX;
    float _playerAccelY;
    float _playerSpeedX;
    float _playerSpeedY;
    
}

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	HelloWorldLayer *layer = [HelloWorldLayer node];
	[scene addChild: layer];
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super initWithColor:ccc4(94, 63, 107, 255)]) ) {
        
        self.accelerometerEnabled = YES;
        
        winsize = [CCDirector sharedDirector].winSize;
        
        playerSprite = [CCSprite spriteWithFile:@"Player.png"];
        playerSprite.position = ccp(120, 200);
        [self addChild:playerSprite];
		
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
		[super dealloc];
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
    const double FilteringFactor = 0.75;
    
    accelerometerX = acceleration.x * FilteringFactor + accelerometerX * (1.0 - FilteringFactor);
    accelerometerY = acceleration.y * FilteringFactor + accelerometerY * (1.0 - FilteringFactor);}

@end
