//
//  ActionSprite.h
//  PomaDroid
//
//  Created by Lucky Lakhwani on 18/04/14.
//  Copyright 2014 Lucky Lakhwani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ActionSprite : CCSprite {
    
}

#pragma mark Character Actions
@property(nonatomic,strong)id idleAction;
@property(nonatomic,strong)id attackAction;
@property(nonatomic,strong)id walkAction;
@property(nonatomic,strong)id hurtAction;
@property(nonatomic,strong)id knockedAction;

#pragma mark collision boxes
@property(nonatomic,assign)BoundingBox hitBox;
@property(nonatomic,assign)BoundingBox attackBox;

#pragma mark Character States
@property(nonatomic,assign)ActionState actionState;

#pragma mark Attributes
@property(nonatomic,assign)float walkSpeed;
@property(nonatomic,assign)float hitPoints;
@property(nonatomic,assign)float damage;

#pragma mark movement
@property(nonatomic,assign)CGPoint velocity;
@property(nonatomic,assign)CGPoint desiredPosition;

#pragma mark measurements
@property(nonatomic,assign)float centerToSides;
@property(nonatomic,assign)float centerToBottom;

#pragma mark Action Methods
-(void)idle;
-(void)attack;
-(void)hurtWithDamage:(float)damage;
-(void)knockout;
-(void)walkWithDirection:(CGPoint)direction;

#pragma mark Update Methods
-(void)update:(ccTime)dt;

#pragma mark collision box factory method
-(BoundingBox)createBoundingBoxWithOrigin:(CGPoint)origin size:(CGSize)size;



@end
