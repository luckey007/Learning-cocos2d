//
//  HelloWorldLayer.mm
//  CutCut
//
//  Created by Lucky Lakhwani on 02/04/14.
//  Copyright Lucky Lakhwani 2014. All rights reserved.
//

// Import the interfaces
#import "HelloWorldLayer.h"

// Not included in "cocos2d.h"
#import "CCPhysicsSprite.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#import "Strawberry.h"
#import "Pineapple.h"
#import "Grapes.h"
#import "Banana.h"
#import "Bomb.h"
#import "Watermelon.h"


enum {
	kTagParentNode = 1,
};


#pragma mark - HelloWorldLayer

@interface HelloWorldLayer()
-(void) initPhysics;
@end

int comparator(const void *a, const void *b) {
    const b2Vec2 *va = (const b2Vec2 *)a;
    const b2Vec2 *vb = (const b2Vec2 *)b;
    
    if (va->x > vb->x) {
        return 1;
    } else if (va->x < vb->x) {
        return -1;
    }
    return 0;
}

@implementation HelloWorldLayer

@synthesize blades = _blades;

#pragma mark init methods

-(id) init
{
    if( (self=[super init])) {
        // enable events
        self.touchEnabled = YES;
        self.accelerometerEnabled = YES;
        
        // init physics
        [self initPhysics];
        [self initSprites];
        [self initHUD];
        [self initBackground];

        _raycastCallback = new RayCastCallback();
        
        _deltaRemainder = 0.0;
        _blades = [[CCArray alloc] initWithCapacity:3];
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"streak.png"];
        
        for (int i = 0; i < 3; i++)
        {
            CCBlade *blade = [CCBlade bladeWithMaximumPoint:50];
            blade.autoDim = NO;
            blade.texture = texture;
            
            [self addChild:blade z:2];
            [_blades addObject:blade];
        }
    
        _nextTossTime = CACurrentMediaTime() + 1;
        _queuedForToss = 0;
        [self scheduleUpdate];
    }
    return self;
}

-(void)initBackground
{
    CGSize screen = [[CCDirector sharedDirector] winSize];
    CCSprite *background = [CCSprite spriteWithFile:@"bg.png"];
    background.position = ccp(screen.width/2,screen.height/2);
    [self addChild:background];
}

-(void) initPhysics
{
	b2Vec2 gravity;
    gravity.Set(0.0f, -4.25f);
	world = new b2World(gravity);
	
	
	// Do we want to let bodies sleep?
	world->SetAllowSleeping(true);
	
	world->SetContinuousPhysics(true);
	
	m_debugDraw = new GLESDebugDraw( PTM_RATIO );
	world->SetDebugDraw(m_debugDraw);
	
	uint32 flags = 0;
	flags += b2Draw::e_shapeBit;
	//		flags += b2Draw::e_jointBit;
	//		flags += b2Draw::e_aabbBit;
	//		flags += b2Draw::e_pairBit;
	//		flags += b2Draw::e_centerOfMassBit;
	m_debugDraw->SetFlags(flags);
	
	
	// Define the ground body.
	b2BodyDef groundBodyDef;
	groundBodyDef.position.Set(0, 0); // bottom-left corner
	
	// Call the body factory which allocates memory for the ground body
	// from a pool and creates the ground box shape (also from a pool).
	// The body is also added to the world.
//	b2Body* groundBody = world->CreateBody(&groundBodyDef);
//	
//	// Define the ground box shape.
//	b2EdgeShape groundBox;
//	
//	// bottom
//	
//	groundBox.Set(b2Vec2(0,0), b2Vec2(s.width/PTM_RATIO,0));
//	groundBody->CreateFixture(&groundBox,0);
//	
//	// top
//	groundBox.Set(b2Vec2(0,s.height/PTM_RATIO), b2Vec2(s.width/PTM_RATIO,s.height/PTM_RATIO));
//	groundBody->CreateFixture(&groundBox,0);
//	
//	// left
//	groundBox.Set(b2Vec2(0,s.height/PTM_RATIO), b2Vec2(0,0));
//	groundBody->CreateFixture(&groundBox,0);
//	
//	// right
//	groundBox.Set(b2Vec2(s.width/PTM_RATIO,s.height/PTM_RATIO), b2Vec2(s.width/PTM_RATIO,0));
//	groundBody->CreateFixture(&groundBox,0);
}


-(void)initSprites
{
    _cache = [[CCArray alloc] initWithCapacity:53];
    
    for (int i = 0; i < 10; i++)
    {
        PolygonSprite *sprite = [[Watermelon alloc] initWithWorld:world];
        sprite.position = ccp(-64*(i+1),-64);
        [self addChild:sprite z:1];
        [_cache addObject:sprite];
    }
    for (int i = 0; i < 10; i++)
    {
        PolygonSprite *sprite = [[Strawberry alloc] initWithWorld:world];
        sprite.position = ccp(-64*(i+1),-64);
        [self addChild:sprite z:1];
        [_cache addObject:sprite];
    }
    for (int i = 0; i < 10; i++)
    {
        PolygonSprite *sprite = [[Pineapple alloc] initWithWorld:world];
        sprite.position = ccp(-64*(i+1),-64);
        [self addChild:sprite z:1];
        [_cache addObject:sprite];
    }
    for (int i = 0; i < 10; i++)
    {
        PolygonSprite *sprite = [[Grapes alloc] initWithWorld:world];
        sprite.position = ccp(-64*(i+1),-64);
        [self addChild:sprite z:1];
        [_cache addObject:sprite];
    }
    for (int i = 0; i < 10; i++)
    {
        PolygonSprite *sprite = [[Banana alloc] initWithWorld:world];
        sprite.position = ccp(-64*(i+1),-64);
        [self addChild:sprite z:1];
        [_cache addObject:sprite];
    }
    
    for (int i = 0; i < 3; i++)
    {
        PolygonSprite *sprite = [[Bomb alloc] initWithWorld:world];
        sprite.position = ccp(-64*(i+1),-64);
        [self addChild:sprite z:1];
        [_cache addObject:sprite];
    }
}


-(void)tossSprite:(PolygonSprite*)sprite
{
    CGSize screen = [[CCDirector sharedDirector] winSize];
    CGPoint randomPosition = ccp(frandom_range(100, screen.width-164), -64);
    float randomAngularVelocity = frandom_range(-1, 1);
    
    float xModifier = 50*(randomPosition.x - 100)/(screen.width - 264);
    float min = -25.0 - xModifier;
    float max = 75.0 - xModifier;
    
    float randomXVelocity = frandom_range(min,max);
    float randomYVelocity = frandom_range(250, 300);
    
    sprite.state = kStateTossed;
    sprite.position = randomPosition;
    [sprite activateCollisions];
    sprite.body->SetLinearVelocity(b2Vec2(randomXVelocity/PTM_RATIO,randomYVelocity/PTM_RATIO));
    sprite.body->SetAngularVelocity(randomAngularVelocity);
}

-(void)spriteLoop
{
    double curTime = CACurrentMediaTime();
    
    //step 1
    if (curTime > _nextTossTime)
    {
        PolygonSprite *sprite;
        int chance = arc4random()%8;
        if (chance == 0)
        {
            CCARRAY_FOREACH(_cache, sprite)
            {
                if (sprite.state == kStateIdle && sprite.type == kTypeBomb)
                {
                    [self tossSprite:sprite];
                    break;
                }
            }
        }
        
        int random = random_range(0, 4);
        //step 2
        Type type = (Type)random;
        if (_currentTossType == kTossConsecutive && _queuedForToss > 0)
        {
            CCARRAY_FOREACH(_cache, sprite)
            {
                if (sprite.state == kStateIdle && sprite.type == type)
                {
                    [self tossSprite:sprite];
                    _queuedForToss--;
                    break;
                }
            }
        }
        else
        { //step 3
            _queuedForToss = random_range(3, 8);
            int tossType = random_range(0,1);
            
            _currentTossType = (TossType)tossType;
            //step 4
            if (_currentTossType == kTossSimultaneous)
            {
                CCARRAY_FOREACH(_cache, sprite)
                {
                    if (sprite.state == kStateIdle && sprite.type == type)
                    {
                        [self tossSprite:sprite];
                        _queuedForToss--;
                        random = random_range(0, 4);
                        type = (Type)random;
                        
                        if (_queuedForToss == 0)
                        {
                            break;
                        }
                    }
                }
            } //step 5
            else if (_currentTossType == kTossConsecutive)
            {
                CCARRAY_FOREACH(_cache, sprite)
                {
                    if (sprite.state == kStateIdle && sprite.type == type)
                    {
                        [self tossSprite:sprite];
                        _queuedForToss--;
                        break;
                    }
                }
            }
        }
        //step 6
        if (_queuedForToss == 0)
        {
            _tossInterval = frandom_range(2,3);
            _nextTossTime = curTime + _tossInterval;
        }
        else
        {
            _tossInterval = frandom_range(0.3,0.8);
            _nextTossTime = curTime + _tossInterval;
        }
    }
}

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

-(void) draw
{
	//
	// IMPORTANT:
	// This is only for debug purposes
	// It is recommend to disable it
	//
	[super draw];
	
	ccGLEnableVertexAttribs( kCCVertexAttribFlag_Position );
	
	kmGLPushMatrix();
    
    //ccDrawLine(_startPoint, _endPoint);
    
	//world->DrawDebugData();
	
	kmGLPopMatrix();
}



-(void) update: (ccTime) dt
{
	//It is recommended that a fixed time step is used with Box2D for stability
	//of the simulation, however, we are using a variable time step here.
	//You need to make an informed choice, the following URL is useful
	//http://gafferongames.com/game-physics/fix-your-timestep/
	
	int32 velocityIterations = 8;
	int32 positionIterations = 1;
	
	// Instruct the world to perform a single step of simulation. It is
	// generally best to keep the time step and iterations fixed.
	world->Step(dt, velocityIterations, positionIterations);
    [self checkAndSliceObjects];
    [self cleanSprites];
    [self spriteLoop];
    
    if ([_blade.path count] > 3) {
        _deltaRemainder+=dt*60*1.2;
        int pop = (int)roundf(_deltaRemainder);
        _deltaRemainder-=pop;
        [_blade pop:pop];
    }
}

-(void)splitPolygonSprite:(PolygonSprite*)sprite
{
    //declare & initialize variables to be used for later
    PolygonSprite *newSprite1, *newSprite2;
    
    //our original shape's attributes
    b2Fixture *originalFixture = sprite.body->GetFixtureList();
    b2PolygonShape *originalPolygon = (b2PolygonShape*)originalFixture->GetShape();
    int vertexCount = originalPolygon->GetVertexCount();
    
    //our determinant(to be described later) and iterator
    float determinant;
    int i;
    
    //you store the vertices of our two new sprites here
    b2Vec2 *sprite1Vertices = (b2Vec2*)calloc(24, sizeof(b2Vec2));
    b2Vec2 *sprite2Vertices = (b2Vec2*)calloc(24, sizeof(b2Vec2));
    b2Vec2 *sprite1VerticesSorted, *sprite2VerticesSorted;
    
    //you store how many vertices there are for each of the two new sprites here
    int sprite1VertexCount = 0;
    int sprite2VertexCount = 0;
    
    //step 1:
    //the entry and exit point of our cut are considered vertices of our two new shapes, so you add these before anything else
    sprite1Vertices[sprite1VertexCount++] = sprite.entryPoint;
    sprite1Vertices[sprite1VertexCount++] = sprite.exitPoint;
    sprite2Vertices[sprite2VertexCount++] = sprite.entryPoint;
    sprite2Vertices[sprite2VertexCount++] = sprite.exitPoint;
    
    //step 2:
    //iterate through all the vertices and add them to each sprite's shape
    for (i=0; i<vertexCount; i++)
    {
        //get our vertex from the polygon
        b2Vec2 point = originalPolygon->GetVertex(i);
        
        //you check if our point is not the same as our entry or exit point first
        b2Vec2 diffFromEntryPoint = point - sprite.entryPoint;
        b2Vec2 diffFromExitPoint = point - sprite.exitPoint;
        
        if ((diffFromEntryPoint.x == 0 && diffFromEntryPoint.y == 0) || (diffFromExitPoint.x == 0 && diffFromExitPoint.y == 0))
        {
        }
        else
        {
            determinant = calculate_determinant_2x3(sprite.entryPoint.x, sprite.entryPoint.y, sprite.exitPoint.x, sprite.exitPoint.y, point.x, point.y);
            
            if (determinant > 0)
            {
                //if the determinant is positive, then the three points are in clockwise order
                sprite1Vertices[sprite1VertexCount++] = point;
            }
            else
            {
                //if the determinant is 0, the points are on the same line. if the determinant is negative, then they are in counter-clockwise order
                sprite2Vertices[sprite2VertexCount++] = point;
                
            }//endif
        }//endif
    }//endfor
    
    //step 3:
    //Box2D needs vertices to be arranged in counter-clockwise order so you reorder our points using a custom function
    sprite1VerticesSorted = [self arrangeVertices:sprite1Vertices count:sprite1VertexCount];
    sprite2VerticesSorted = [self arrangeVertices:sprite2Vertices count:sprite2VertexCount];
    
    //step 4:
    //Box2D has some restrictions with defining shapes, so you have to consider these. You only cut the shape if both shapes pass certain requirements from our function
    BOOL sprite1VerticesAcceptable = [self areVerticesAcceptable:sprite1VerticesSorted count:sprite1VertexCount];
    BOOL sprite2VerticesAcceptable = [self areVerticesAcceptable:sprite2VerticesSorted count:sprite2VertexCount];
    
    //step 5:
    //you destroy the old shape and create the new shapes and sprites
    if (sprite1VerticesAcceptable && sprite2VerticesAcceptable)
    {
        b2Vec2 worldEntry = sprite.body->GetWorldPoint(sprite.entryPoint);
        b2Vec2 worldExit = sprite.body->GetWorldPoint(sprite.exitPoint);
        float angle = ccpToAngle(ccpSub(ccp(worldExit.x,worldExit.y), ccp(worldEntry.x,worldEntry.y)));
        CGPoint vector1 = ccpForAngle(angle + 1.570796);
        CGPoint vector2 = ccpForAngle(angle - 1.570796);
        float midX = midpoint(worldEntry.x, worldExit.x);
        float midY = midpoint(worldEntry.y, worldExit.y);
        
        //create the first sprite's body
        b2Body *body1 = [self createBodyWithPosition:sprite.body->GetPosition() rotation:sprite.body->GetAngle() vertices:sprite1VerticesSorted vertexCount:sprite1VertexCount density:originalFixture->GetDensity() friction:originalFixture->GetFriction() restitution:originalFixture->GetRestitution()];
        
        //create the first sprite
        
        newSprite1 = [PolygonSprite spriteWithTexture:sprite.texture body:body1 original:NO];
        [self addChild:newSprite1 z:1];
        newSprite1.body->ApplyLinearImpulse(b2Vec2(2*body1->GetMass()*vector1.x,2*body1->GetMass()*vector1.y), b2Vec2(midX,midY));
        
        //create the second sprite's body
        b2Body *body2 = [self createBodyWithPosition:sprite.body->GetPosition() rotation:sprite.body->GetAngle() vertices:sprite2VerticesSorted vertexCount:sprite2VertexCount density:originalFixture->GetDensity() friction:originalFixture->GetFriction() restitution:originalFixture->GetRestitution()];
        
        //create the second sprite
        newSprite2 = [PolygonSprite spriteWithTexture:sprite.texture body:body2 original:NO];
        [self addChild:newSprite2 z:1];
        newSprite2.body->ApplyLinearImpulse(b2Vec2(2*body2->GetMass()*vector2.x,2*body2->GetMass()*vector2.y), b2Vec2(midX,midY));
        
        //you don't need the old shape & sprite anymore so you either destroy it or squirrel it away
        if (sprite.original)
        {
            sprite.state = kStateIdle;
            [sprite deactivateCollisions];
            sprite.position = ccp(-256,-256);   //cast them faraway
            sprite.sliceEntered = NO;
            sprite.sliceExited = NO;
            sprite.entryPoint.SetZero();
            sprite.exitPoint.SetZero();
            
            if (sprite.type == kTypeBomb)
            {
                [self subtractLife];
            }
            else
            {
                //placeholder
            }
        }
        else
        {
            world->DestroyBody(sprite.body);
            [self removeChild:sprite cleanup:YES];
        }
    }
    else
    {
        sprite.sliceEntered = NO;
        sprite.sliceExited = NO;
    }
    
    //free up our allocated vectors
    free(sprite1VerticesSorted);
    free(sprite2VerticesSorted);
    free(sprite1Vertices);
    free(sprite2Vertices);
}

-(b2Body*)createBodyWithPosition:(b2Vec2)position rotation:(float)rotation vertices:(b2Vec2*)vertices vertexCount:(int32)count density:(float)density friction:(float)friction restitution:(float)restitution
{
    b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position = position;
    bodyDef.angle = rotation;
    b2Body *body = world->CreateBody(&bodyDef);
    
    b2FixtureDef fixtureDef;
    fixtureDef.density = density;
    fixtureDef.friction = friction;
    fixtureDef.restitution = restitution;
    
    b2PolygonShape shape;
    shape.Set(vertices, count);
    fixtureDef.shape = &shape;
    body->CreateFixture(&fixtureDef);
    
    return body;
}

-(b2Vec2*)arrangeVertices:(b2Vec2*)vertices count:(int)count
{
    float determinant;
    int iCounterClockWise = 1;
    int iClockWise = count - 1;
    int i;
    
    b2Vec2 referencePointA,referencePointB;
    b2Vec2 *sortedVertices = (b2Vec2*)calloc(count, sizeof(b2Vec2));
    
    //sort all vertices in ascending order according to their x-coordinate so you can get two points of a line
    qsort(vertices, count, sizeof(b2Vec2), comparator);
    
    sortedVertices[0] = vertices[0];
    referencePointA = vertices[0];          //leftmost point
    referencePointB = vertices[count-1];    //rightmost point
    
    //you arrange the points by filling our vertices in both clockwise and counter-clockwise directions using the determinant function
    for (i=1;i<count-1;i++)
    {
        determinant = calculate_determinant_2x3(referencePointA.x, referencePointA.y, referencePointB.x, referencePointB.y, vertices[i].x, vertices[i].y);
        if (determinant<0)
        {
            sortedVertices[iCounterClockWise++] = vertices[i];
        }
        else
        {
            sortedVertices[iClockWise--] = vertices[i];
        }//endif
    }//endif
    
    sortedVertices[iCounterClockWise] = vertices[count-1];
    return sortedVertices;
}

-(BOOL)areVerticesAcceptable:(b2Vec2*)vertices count:(int)count
{
    //check 1: polygons need to at least have 3 vertices
    if (count < 3)
    {
        return NO;
    }
    
    //check 2: the number of vertices cannot exceed b2_maxPolygonVertices
    if (count > b2_maxPolygonVertices)
    {
        return NO;
    }
    
    //check 3: Box2D needs the distance from each vertex to be greater than b2_epsilon
    int32 i;
    for (i=0; i<count; ++i)
    {
        int32 i1 = i;
        int32 i2 = i + 1 < count ? i + 1 : 0;
        b2Vec2 edge = vertices[i2] - vertices[i1];
        if (edge.LengthSquared() <= b2_epsilon * b2_epsilon)
        {
            return NO;
        }
    }
    
    //check 4: Box2D needs the area of a polygon to be greater than b2_epsilon
    float32 area = 0.0f;
    
    b2Vec2 pRef(0.0f,0.0f);
    
    for (i=0; i<count; ++i)
    {
        b2Vec2 p1 = pRef;
        b2Vec2 p2 = vertices[i];
        b2Vec2 p3 = i + 1 < count ? vertices[i+1] : vertices[0];
        
        b2Vec2 e1 = p2 - p1;
        b2Vec2 e2 = p3 - p1;
        
        float32 D = b2Cross(e1, e2);
        
        float32 triangleArea = 0.5f * D;
        area += triangleArea;
    }
    
    if (area <= 0.0001)
    {
        return NO;
    }
    
    //check 5: Box2D requires that the shape be Convex.
    float determinant;
    float referenceDeterminant;
    b2Vec2 v1 = vertices[0] - vertices[count-1];
    b2Vec2 v2 = vertices[1] - vertices[0];
    referenceDeterminant = calculate_determinant_2x2(v1.x, v1.y, v2.x, v2.y);
    
    for (i=1; i<count-1; i++)
    {
        v1 = v2;
        v2 = vertices[i+1] - vertices[i];
        determinant = calculate_determinant_2x2(v1.x, v1.y, v2.x, v2.y);
        //you use the determinant to check direction from one point to another. A convex shape's points should only go around in one direction. The sign of the determinant determines that direction. If the sign of the determinant changes mid-way, then you have a concave shape.
        if (referenceDeterminant * determinant < 0.0f)
        {
            //if multiplying two determinants result to a negative value, you know that the sign of both numbers differ, hence it is concave
            return NO;
        }
    }
    v1 = v2;
    v2 = vertices[0]-vertices[count-1];
    determinant = calculate_determinant_2x2(v1.x, v1.y, v2.x, v2.y);
    if (referenceDeterminant * determinant < 0.0f)
    {
        return NO;
    }
    return YES;
}

-(void)checkAndSliceObjects
{
    double curTime = CACurrentMediaTime();
    for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
    {
        if (b->GetUserData() != NULL) {
            PolygonSprite *sprite = (PolygonSprite*)b->GetUserData();
            
            if (sprite.sliceEntered && curTime > sprite.sliceEntryTime)
            {
                sprite.sliceEntered = NO;
            }
            else if (sprite.sliceEntered && sprite.sliceExited)
            {
                [self splitPolygonSprite:sprite];
            }
        }
    }
}

-(void)clearSlices
{
    for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
    {
        if (b->GetUserData() != NULL) {
            PolygonSprite *sprite = (PolygonSprite*)b->GetUserData();
            sprite.sliceEntered = NO;
            sprite.sliceExited = NO;
        }
    }
}

-(void)initHUD
{
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    _cuts = 0;
    _lives = 3;
    
    for (int i = 0; i < 3; i++)
    {
        CCSprite *cross = [CCSprite spriteWithFile:@"x_unfilled.png"];
        cross.position = ccp(screen.width - cross.contentSize.width/2 - i*cross.contentSize.width, screen.height - cross.contentSize.height/2);
        [self addChild:cross z:4];
    }
    
    CCSprite *cutsIcon = [CCSprite spriteWithFile:@"fruit_cut.png"];
    cutsIcon.position = ccp(cutsIcon.contentSize.width/2, screen.height - cutsIcon.contentSize.height/2);
    [self addChild:cutsIcon];
    
    _cutsLabel = [CCLabelTTF labelWithString:@"0" fontName:@"Helvetica Neue" fontSize:30];
    _cutsLabel.anchorPoint = ccp(0, 0.5);
    _cutsLabel.position = ccp(cutsIcon.position.x + cutsIcon.contentSize.width/2 + _cutsLabel.contentSize.width/2,cutsIcon.position.y);
    [self addChild:_cutsLabel z:4];
}

-(void)restart
{
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
}

-(void)endGame
{
    [self unscheduleUpdate];
    CCMenuItemLabel *label = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"RESTART"fontName:@"Helvetica Neue"fontSize:50] target:self selector:@selector(restart)];
    CCMenu *menu = [CCMenu menuWithItems:label, nil];
    CGSize screen = [[CCDirector sharedDirector] winSize];
    menu.position = ccp(screen.width/2, screen.height/2);
    [self addChild:menu z:4];
}

-(void)subtractLife
{
    CGSize screen = [[CCDirector sharedDirector] winSize];
    _lives--;
    CCSprite *lostLife = [CCSprite spriteWithFile:@"x_filled.png"];
    lostLife.position = ccp(screen.width - lostLife.contentSize.width/2 - _lives*lostLife.contentSize.width, screen.height - lostLife.contentSize.height/2);
    [self addChild:lostLife z:4];
    
    if (_lives <= 0)
    {
        [self endGame];
    }
}

-(void)cleanSprites
{
    PolygonSprite *sprite;
    
    //we check for all tossed sprites that have dropped offscreen and reset them
    CCARRAY_FOREACH(_cache, sprite)
    {
        if (sprite.state == kStateTossed)
        {
            CGPoint spritePosition = ccp(sprite.body->GetPosition().x*PTM_RATIO,sprite.body->GetPosition().y*PTM_RATIO);
            float yVelocity = sprite.body->GetLinearVelocity().y;
            
            //this means the sprite has dropped offscreen
            if (spritePosition.y < -64 && yVelocity < 0)
            {
                sprite.state = kStateIdle;
                sprite.sliceEntered = NO;
                sprite.sliceExited = NO;
                sprite.entryPoint.SetZero();
                sprite.exitPoint.SetZero();
                sprite.position = ccp(-64,-64);
                sprite.body->SetLinearVelocity(b2Vec2(0.0,0.0));
                sprite.body->SetAngularVelocity(0.0);
                [sprite deactivateCollisions];
            }
        }
    }
    
    //we check for all sliced pieces that have dropped offscreen and remove them
    CGSize screen = [[CCDirector sharedDirector] winSize];
    for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
    {
        if (b->GetUserData() != NULL) {
            PolygonSprite *sprite = (PolygonSprite*)b->GetUserData();
            CGPoint position = ccp(b->GetPosition().x*PTM_RATIO,b->GetPosition().y*PTM_RATIO);
            if (position.x < -64 || position.x > screen.width || position.y < -64)
            {
                if (!sprite.original)
                {
                    world->DestroyBody(sprite.body);
                    [self removeChild:sprite cleanup:YES];
                }
            }
        }
    }
}


#pragma mark Touch Events

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInView:[touch view]];
        location = [[CCDirector sharedDirector] convertToGL:location];
        _startPoint = location;
        _endPoint = location;
        
        CCBlade *blade;
        CCARRAY_FOREACH(_blades, blade)
        {
            if (blade.path.count == 0)
            {
                _blade = blade;
                [_blade push:location];
                break;
            }
        }

    }
    
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInView:[touch view]];
        location = [[CCDirector sharedDirector] convertToGL:location];
        _endPoint = location;
        [_blade push:location];

    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	//Add a new body/atlas sprite at the touched location
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		
		location = [[CCDirector sharedDirector] convertToGL: location];
        
        [self clearSlices];
	}
    
    if (ccpLengthSQ(ccpSub(_startPoint, _endPoint)) > 25)
    {
        world->RayCast(_raycastCallback,
                       b2Vec2(_startPoint.x / PTM_RATIO, _startPoint.y / PTM_RATIO),
                       b2Vec2(_endPoint.x / PTM_RATIO, _endPoint.y / PTM_RATIO));
        
        world->RayCast(_raycastCallback,
                       b2Vec2(_endPoint.x / PTM_RATIO, _endPoint.y / PTM_RATIO),
                       b2Vec2(_startPoint.x / PTM_RATIO, _startPoint.y / PTM_RATIO));
        _startPoint = _endPoint;
    }
    
     [_blade dim:YES];

}

#pragma mark Dealloc Method

-(void) dealloc
{
	delete world;
	world = NULL;
	
	delete m_debugDraw;
	m_debugDraw = NULL;
    
    [_cache release];
    _cache = nil;
    
    [_blades release];
    _blades = nil;
	
	[super dealloc];
}

@end
