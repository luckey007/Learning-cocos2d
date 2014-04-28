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
    float playerAccelX;
    float playerAccelY;
    float playerSpeedX;
    float playerSpeedY;
    
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
         [self scheduleUpdate];
        
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
    accelerometerY = acceleration.y * FilteringFactor + accelerometerY * (1.0 - FilteringFactor);

    if (accelerometerY > 0.05)
    {
        playerAccelX = -MaxPlayerAccel;
    }
    else if (accelerometerY < -0.05)
    {
        playerAccelX = MaxPlayerAccel;
    }
    if (accelerometerX < -0.05)
    {
        playerAccelY = -MaxPlayerAccel;
    }
    else if (accelerometerX > 0.05)
    {
        playerAccelY = MaxPlayerAccel;
    }
    
}

- (void)updatePlayer:(ccTime)dt
{
    // 1
    playerSpeedX += playerAccelX * dt;
    playerSpeedY += playerAccelY * dt;
    
    // 2
    playerSpeedX = fmaxf(fminf(playerSpeedX, MaxPlayerSpeed), -MaxPlayerSpeed);
    playerSpeedY = fmaxf(fminf(playerSpeedY, MaxPlayerSpeed), -MaxPlayerSpeed);
    
    // 3
    float newX = playerSprite.position.x + playerSpeedX*dt;
    float newY = playerSprite.position.y + playerSpeedY*dt;
    
    // 4
    newX = MIN(winsize.width, MAX(newX, 0));
    newY = MIN(winsize.height, MAX(newY, 0));
    
    playerSprite.position = ccp(newX, newY);
}

- (void)update:(ccTime)dt
{
    [self updatePlayer:dt];
}

@end
