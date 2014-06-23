//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#import "CPShape.h"

@class CPPhysicsLayer;

/**
 * CPObject is a fixed/dynamic physics enabled object.
 */
@interface CPObject : NSObject {
    // A CPActor has a body if it is attached to the physics world.
    b2Body *body;
    
    CGFloat friction;
    CGFloat restitution;
    
    // It has a sprite if it's visible.
    CCNode *sprite;
    
    // Our Shape
    id<CPShape> shape;
    
    // Our parent layer.
    CPPhysicsLayer *parent;
    
    BOOL positionDirty;
    CGPoint position;
    
    float rotation;
    BOOL rotationDirty;
    
    BOOL queueToDestroy;
    int tag;
}

+(CPObject*)objectWithShape:(id<CPShape>)s
                     parent:(CPPhysicsLayer*)p
                         friction:(CGFloat)friction
                      restitution:(CGFloat)restitution;

-(id)initWithShape:(id<CPShape>)s
            parent:(CPPhysicsLayer*)p
          friction:(CGFloat)friction
       restitution:(CGFloat)restitution;

-(void)destroy;

// Sprites.
-(void)setSprite:(CCNode*)s;
-(void)setSprite:(CCNode *)s z:(int)z;
-(void)hideSprite;
-(void)showSprite;

-(void)setPosition:(CGPoint)p;
-(CGPoint)getPosition;

-(void)setRotation:(float)angle;

-(CGRect)boundingBox;

-(void)bodyMoved;

-(void)tick:(ccTime)dt;

-(void)createBody;

-(void)addToGround;

-(void)objectDestroyed;

-(BOOL)isMoving;

-(void)disable;
-(void)enable;
-(BOOL)isEnabled;

@property(nonatomic, readonly) CCNode *sprite;
@property(nonatomic, readonly) id<CPShape> shape;
@property(nonatomic, assign) int tag;
@property(nonatomic, readonly) b2Body* body;

@end

