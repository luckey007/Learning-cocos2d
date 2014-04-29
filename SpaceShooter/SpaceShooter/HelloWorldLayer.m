//
//  HelloWorldLayer.m
//  SpaceShooter
//
//  Created by Lucky Lakhwani on 28/04/14.
//  Copyright Lucky Lakhwani 2014. All rights reserved.
//

#define kFilteringFactor 0.1
#define kRestAccelX -0.6
#define kShipMaxPointsPerSec  0.5
#define kMaxDiffX 0.2
#define kNumAsteroids   15
#define kNumLasers      5
#define KRestAccelY -0.2

// Import the interfaces
#import "HelloWorldLayer.h"
#import "CCParallaxNode-Extras.h"

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
        
        NSArray *starsArray = [NSArray arrayWithObjects:@"Stars1.plist", @"Stars2.plist", @"Stars3.plist", nil];
        for(NSString *stars in starsArray) {
            CCParticleSystemQuad *starsEffect = [CCParticleSystemQuad particleWithFile:stars];
            [self addChild:starsEffect z:1];
        }
        
        
        _asteroids = [[CCArray alloc] initWithCapacity:kNumAsteroids];
        for(int i = 0; i < kNumAsteroids; ++i) {
            CCSprite *asteroid = [CCSprite spriteWithSpriteFrameName:@"asteroid.png"];
            asteroid.visible = NO;
            [batchNode addChild:asteroid];
            [_asteroids addObject:asteroid];
        }
        
        _shipLasers = [[CCArray alloc] initWithCapacity:kNumLasers];
        for(int i = 0; i < kNumLasers; ++i) {
            CCSprite *shipLaser = [CCSprite spriteWithSpriteFrameName:@"laserbeam_blue.png"];
            shipLaser.visible = NO;
            [batchNode addChild:shipLaser];
            [_shipLasers addObject:shipLaser];
        }
        
        self.touchEnabled = YES;
        self.accelerometerEnabled = YES;

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

- (float)randomValueBetween:(float)low andValue:(float)high {
    return (((float) arc4random() / 0xFFFFFFFFu) * (high - low)) + low;
}

- (void)update:(ccTime)dt {
    
    CGPoint backgroundScrollVel = ccp(-1000, 0);
    backgroundNode.position = ccpAdd(backgroundNode.position, ccpMult(backgroundScrollVel, dt));
    
    NSArray *spaceDusts = [NSArray arrayWithObjects:spacedust1, spacedust2, nil];
    for (CCSprite *spaceDust in spaceDusts) {
        if ([backgroundNode convertToWorldSpace:spaceDust.position].x < -spaceDust.contentSize.width) {
            [backgroundNode incrementOffset:ccp(2*spaceDust.contentSize.width,0) forChild:spaceDust];
        }
    }
    
    NSArray *backgrounds = [NSArray arrayWithObjects:planetsunrise, galaxy, spacialanomaly, spacialanomaly2, nil];
    for (CCSprite *background in backgrounds) {
        if ([backgroundNode convertToWorldSpace:background.position].x < -background.contentSize.width) {
            [backgroundNode incrementOffset:ccp(2000,0) forChild:background];
        }
    }
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    float maxY = winSize.height - ship.contentSize.height/2;
    float minY = ship.contentSize.height/2;
    
    float newX = ship.position.x + (shipPointsPerSecY * dt);
    newX = MIN(maxY, MAX(newX, minY));

    
    float newY = ship.position.y + (shipPointsPerSec * dt);
    newY = MIN(MAX(newY, minY), maxY);
    ship.position = ccp(newX, newY);

    double curTime = CACurrentMediaTime();
    if (curTime > _nextAsteroidSpawn) {
        
        float randSecs = [self randomValueBetween:0.20 andValue:1.0];
        _nextAsteroidSpawn = randSecs + curTime;
        
        float randY = [self randomValueBetween:0.0 andValue:winSize.height];
        float randDuration = [self randomValueBetween:2.0 andValue:10.0];
        
        CCSprite *asteroid = [_asteroids objectAtIndex:_nextAsteroid];
        _nextAsteroid++;
        if (_nextAsteroid >= _asteroids.count) _nextAsteroid = 0;
        
        [asteroid stopAllActions];
        asteroid.position = ccp(winSize.width+asteroid.contentSize.width/2, randY);
        asteroid.visible = YES;
        [asteroid runAction:[CCSequence actions:
                             [CCMoveBy actionWithDuration:randDuration position:ccp(-winSize.width-asteroid.contentSize.width, 0)],
                             [CCCallFuncN actionWithTarget:self selector:@selector(setInvisible:)],
                             nil]];
        
    }
    
    for (CCSprite *asteroid in _asteroids) {
        if (!asteroid.visible) continue;
        
        for (CCSprite *shipLaser in _shipLasers) {
            if (!shipLaser.visible) continue;
            
            if (CGRectIntersectsRect(shipLaser.boundingBox, asteroid.boundingBox)) {
                shipLaser.visible = NO;
                asteroid.visible = NO;
                continue;
            }
        }
        
        if (CGRectIntersectsRect(ship.boundingBox, asteroid.boundingBox)) {
            asteroid.visible = NO;
            [ship runAction:[CCBlink actionWithDuration:1.0 blinks:4]];
        }
    
    }
    
}


-(void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{

    
    UIAccelerationValue rollingX, rollingY, rollingZ;
    
    rollingX = (acceleration.x * kFilteringFactor) + (rollingX * (1.0 - kFilteringFactor));
    rollingY = (acceleration.y * kFilteringFactor) + (rollingY * (1.0 - kFilteringFactor));
    rollingZ = (acceleration.z * kFilteringFactor) + (rollingZ * (1.0 - kFilteringFactor));
    
    float acelX = acceleration.x - rollingX;
    float acelY = acceleration.y - rollingY;
    float acelZ = acceleration.z - rollingZ;
    
    CGSize winsize = [CCDirector sharedDirector].winSize;
    
    float acceldiff = acelX - kRestAccelX;
    float accelFraction = acceldiff / kMaxDiffX;
    float pointsPerSec = kShipMaxPointsPerSec * winsize.height * accelFraction;
    
    float acceldiffY = acelY - KRestAccelY;
    float accelFractionY = acceldiffY / kMaxDiffX;
    float pointsPerSecY = kShipMaxPointsPerSec * winsize.width * accelFractionY;
    
    shipPointsPerSecY = pointsPerSec;
    shipPointsPerSec = pointsPerSecY;
}

- (void)setInvisible:(CCNode *)node {
    node.visible = NO;
}


- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    CCSprite *shipLaser = [_shipLasers objectAtIndex:_nextShipLaser];
    _nextShipLaser++;
    if (_nextShipLaser >= _shipLasers.count)
        _nextShipLaser = 0;
    
    shipLaser.position = ccpAdd(ship.position, ccp(shipLaser.contentSize.width/2, 0));
    shipLaser.visible = YES;
    [shipLaser stopAllActions];
    [shipLaser runAction:[CCSequence actions:
                          [CCMoveBy actionWithDuration:0.5 position:ccp(winSize.width, 0)],
                          [CCCallFuncN actionWithTarget:self selector:@selector(setInvisible:)],
                          nil]];
    
}
@end
