//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import "CPActor.h"

enum CPAdvancedActorState {
    kCPActorGotoPoint,
    kCPActorInterceptActor,
    kCPActorHoldGround,
    kCPActorFollowMouse,
    kCPActorIdle
};

@interface CPAdvancedActor : CPActor {
    CGFloat radius;
    
    id<CPShape> shapeConstraint;
    CGFloat waitForShapeConstraint;
    
    CPAdvancedActorState state;
    b2MouseJoint *mouseJoint;
    
    CGPoint mouseVelocity;
    CGPoint mousePoint;
    
    CGFloat deltaOne;
    CPActor *interceptActor;
    CGPoint interceptPoint;
    CGFloat interceptDistance;
}

+(CPAdvancedActor*)advancedActorWithShape:(CPDiscShape*)s
                   parent:(CPPhysicsLayer*)p
                  density:(CGFloat)density
                 friction:(CGFloat)friction
            linearDamping:(CGFloat)ld
           angularDamping:(CGFloat)ad
              restitution:(CGFloat)restitution
          topDownFriction:(CGFloat)tdf
            allowRotation:(BOOL)ar;

-(id)initWithShape:(CPDiscShape*)s
            parent:(CPPhysicsLayer*)p
           density:(CGFloat)density
          friction:(CGFloat)friction
     linearDamping:(CGFloat)ld
    angularDamping:(CGFloat)ad
       restitution:(CGFloat)restitution
   topDownFriction:(CGFloat)tdf
     allowRotation:(BOOL)ar;


-(void)restrictInsideShape:(id<CPShape>)s;
-(void)removeRestrictions;

-(float)gotoPoint:(CGPoint)p speed:(CGFloat)s;
-(float)interceptActor:(CPActor*)other beforeReaching:(CGPoint)p maxDistance:(CGFloat)d;
-(void)holdGround;

-(void)setMouseControlled:(BOOL)mc;

@end

