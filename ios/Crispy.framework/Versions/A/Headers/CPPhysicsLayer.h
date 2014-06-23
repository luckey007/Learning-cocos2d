//
//  CPScrollLayer.h
//  sketch
//
//  Created by Kiran Bhivgade on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"

@class CPObject;

@interface CPPhysicsLayer : CCLayer {
    b2World *world;
    b2Body *groundBody;
    NSMutableArray* actors;
    BOOL physicsStopped;
    BOOL gravityFromAccelerometer;
    CGFloat G;
    BOOL fixedTimestep;
    int numTicks;
    int silentOnTicks;
}

@property(nonatomic, readonly) int numTicks;

-(id)initWithSleep:(BOOL)doSleep;
-(void)createEnclosureLeft:(BOOL)l top:(BOOL)t right:(BOOL)r bottom:(BOOL)b restitution:(CGFloat)r friction:(CGFloat)f;

-(void)setGravity:(CGPoint)p;
-(void)setGravityFromAccelerometer:(CGFloat)gConstant;

-(void)step:(ccTime)dt;
-(void)tick:(ccTime)dt;
-(void)silent;

-(void)object:(CPObject*)a startsCollidingWithObject:(CPObject*)b speed:(CGFloat)s;
-(void)object:(CPObject*)a endsCollidingWithObject:(CPObject*)b speed:(CGFloat)s;

-(void)addObject:(CPObject*)actor;
-(void)removeObject:(CPObject*)actor;

-(void)stopPhysics;

/**
 * Start physics with auto stop when number of ticks expire at which point silent method will be called.
 * If ticks is negative than silent will be called when it's actually silence, otherwise it will be called only when ticks expire, even if everybody become silent before. This is important from the point of keeping two different worlds in sync.
 */
-(void)startPhysics:(int)ticks;

-(void)removeAllActors;

@property(nonatomic, readonly) b2World *world;
@property(nonatomic, readonly) b2Body *groundBody;

@end
