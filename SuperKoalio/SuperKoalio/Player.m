
#import "Player.h"


@implementation Player

@synthesize velocity;
@synthesize desiredPosition;
@synthesize onGround;

-(id)initWithFile:(NSString *)filename 
{
    if (self = [super initWithFile:filename]) {
        self.velocity = ccp(0.0, 0.0);
    }
    return self;
}

-(void)update:(ccTime)dt 
{
    
    CGPoint gravity = ccp(0.0, -450.0);
    
    CGPoint gravityStep = ccpMult(gravity, dt);
    
    self.velocity = ccpAdd(self.velocity, gravityStep);
    CGPoint stepVelocity = ccpMult(self.velocity, dt);
    
    self.desiredPosition = ccpAdd(self.position, stepVelocity);
}

-(CGRect)collisionBoundingBox {
    CGRect collisionBox = CGRectInset(self.boundingBox, 3, 0);
    CGPoint diff = ccpSub(self.desiredPosition, self.position);
    CGRect returnBoundingBox = CGRectOffset(collisionBox, diff.x, diff.y);
    return returnBoundingBox;
}

@end
