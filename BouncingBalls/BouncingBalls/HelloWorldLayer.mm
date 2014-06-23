#import "HelloWorldLayer.h"

@implementation HelloWorldLayer

+ (id)scene {
    
    CCScene *scene = [CCScene node];
    HelloWorldLayer *layer = [HelloWorldLayer node];
    [scene addChild:layer];
    return scene;
    
}

- (id)init {
  
    if ((self=[super init])) {
        
        ball = [CCSprite spriteWithFile:@"ball.png"];
        ball.position = ccp(100,30);
        [self addChild:ball];
        
        b2Vec2 gravity = b2Vec2(0.0, -10.0);
        world = new b2World(gravity);
        
        b2BodyDef groundBodyDef;
        groundBodyDef.position.Set(0, 0);
        
        b2Body *groundBody = world->CreateBody(&groundBodyDef);
        b2EdgeShape groundEdge;
        b2FixtureDef boxShapeDef;
        boxShapeDef.shape = &groundEdge;
        
        groundEdge.Set(b2Vec2(0, 0),b2Vec2([[CCDirector sharedDirector]winSize].width, 0));
        groundBody->CreateFixture(&boxShapeDef);
        
        groundEdge.Set(b2Vec2(0,0), b2Vec2(0,[[CCDirector sharedDirector]winSize].height/PTM_RATIO));
        groundBody->CreateFixture(&boxShapeDef);
        
        groundEdge.Set(b2Vec2(0, [[CCDirector sharedDirector]winSize].height/PTM_RATIO),
                       b2Vec2([[CCDirector sharedDirector]winSize].width/PTM_RATIO, [[CCDirector sharedDirector]winSize].height/PTM_RATIO));
        groundBody->CreateFixture(&boxShapeDef);
        
        groundEdge.Set(b2Vec2([[CCDirector sharedDirector]winSize].width/PTM_RATIO, [[CCDirector sharedDirector]winSize].height/PTM_RATIO),
                       b2Vec2([[CCDirector sharedDirector]winSize].width/PTM_RATIO, 0));
        groundBody->CreateFixture(&boxShapeDef);
        
        b2BodyDef ballBodyDef;
        ballBodyDef.type = b2_dynamicBody;
        ballBodyDef.position.Set(100 / PTM_RATIO, 300 / PTM_RATIO);
        ballBodyDef.userData = ball;
        body = world->CreateBody(&ballBodyDef);
        
        b2CircleShape circle;
        circle.m_radius = 26 / PTM_RATIO;
        
        b2FixtureDef ballShapeDef;
        ballShapeDef.shape = &circle;
        ballShapeDef.density = 1.0f;
        ballShapeDef.friction = 0.2f;
        ballShapeDef.restitution = 0.8f;
        body->CreateFixture(&ballShapeDef);
        
        [self schedule:@selector(tick:)];        
        [self setTouchEnabled:YES];
    }
    return self;
}

-(void)tick:(ccTime) dt{
    world->Step(dt, 10, 10);
    for (b2Body *b = world->GetBodyList(); b; b = b->GetNext()) {
        if (b->GetUserData() != NULL) {
            CCSprite *ballData = (CCSprite *)b->GetUserData();
            ballData.position = ccp(b->GetPosition().x * PTM_RATIO, b->GetPosition().y * PTM_RATIO);
            ballData.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());
        }
    }
}

- (void)dealloc {
    delete world;
    body = NULL;
    world = NULL;
    [super dealloc];
}

- (void)ccTouchesBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    b2Vec2 force = b2Vec2(-30, 30);
    body->ApplyLinearImpulse(force, body->GetPosition());
    body->ApplyForceToCenter(force);
}

@end