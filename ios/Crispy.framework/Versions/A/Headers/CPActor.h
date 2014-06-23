//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import "CPObject.h"

@class CPPhysicsLayer;
@class CPSensor;
@class CPAttachment;

/**
 * CPActor is anything that reacts or move inside a world.
 */
@interface CPActor : CPObject {
    // Attachments are sprites that connect
    NSMutableDictionary *attachments;
    CCNode *attachmentNode;
    
    b2FrictionJoint *frictionJoint;
        
    // Sensors, which detect me.
    NSMutableArray *sensors;
    
    BOOL velocityDirty;
    CGPoint velocity;
    
    CGFloat maxSpeed2;
    BOOL hasMaxSpeed;
    BOOL maxSpeedDirty;
    
    float density;
    float linearDamping;
    float angularDamping;
    float topDownFriction;
    float allowRotation;
}

+(CPActor*)actorWithShape:(id<CPShape>)s
                                 parent:(CPPhysicsLayer*)p
                                density:(CGFloat)density
                               friction:(CGFloat)friction
                          linearDamping:(CGFloat)ld
                         angularDamping:(CGFloat)ad
                            restitution:(CGFloat)restitution
                        topDownFriction:(CGFloat)tdf
                          allowRotation:(BOOL)ar;

+(CPActor*)actorWithShape:(id<CPShape>)s parent:(CPPhysicsLayer*)p density:(CGFloat)d allowRotation:(BOOL)ar;

+(void)setGlobalLinearDamping:(float)ld;
+(void)setGlobalAngularDamping:(float)ad;
+(void)setGlobalFriction:(float)f;
+(void)setGlobalRestitution:(float)r;
+(void)setGlobalTopDownFriction:(float)tdf;

-(id)initWithShape:(id<CPShape>)s
            parent:(CPPhysicsLayer*)p
           density:(CGFloat)density
          friction:(CGFloat)friction
     linearDamping:(CGFloat)ld
    angularDamping:(CGFloat)ad
       restitution:(CGFloat)restitution
   topDownFriction:(CGFloat)tdf
     allowRotation:(BOOL)ar;


-(void)setVelocity:(CGPoint)v;
-(CGPoint)getVelocity;
-(CGFloat)getSpeed;
-(CGFloat)getSpeedSquared;
-(void)setSpeed:(CGFloat)s;

-(void)setAttachmentForKey:(NSString*)key attachment:(CPAttachment*)a;
-(void)showAttachment:(NSString*)key;
-(void)hideAttachment:(NSString*)key;
-(void)removeAttachment:(NSString*)key;

-(void)addSensor:(CPSensor*)sensor;

@end

