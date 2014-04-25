//
//  ActionSprite.m
//  PomaDroid
//
//  Created by Lucky Lakhwani on 18/04/14.
//  Copyright 2014 Lucky Lakhwani. All rights reserved.
//

#import "ActionSprite.h"


@implementation ActionSprite


-(void)idle{
    
    if (_actionState != kActionStateIdle){
        [self stopAllActions];
        [self runAction:_idleAction];
        _actionState = kActionStateIdle;
        _velocity = CGPointZero;
    }
}

-(void)attack {
    if (_actionState == kActionStateIdle || _actionState == kActionStateAttack || _actionState == kActionStateWalk) {
        [self stopAllActions];
        [self runAction:_attackAction];
        _actionState = kActionStateAttack;
    }
}

-(void)hurtWithDamage:(float)damage {
    if (_actionState != kActionStateKnockedOut) {
        [self stopAllActions];
        [self runAction:_hurtAction];
        _actionState = kActionStateHurt;
        _hitPoints -= damage;
        
        if (_hitPoints <= 0.0) {
            [self knockout];
        }
    }
}

-(void)knockout {
    [self stopAllActions];
    [self runAction:_knockedAction];
    _hitPoints = 0.0;
    _actionState = kActionStateKnockedOut;
}

-(void)walkWithDirection:(CGPoint)direction {
        if (_actionState == kActionStateIdle) {
            [self stopAllActions];
            [self runAction:_walkAction];
            _actionState = kActionStateWalk;
        }
        if (_actionState == kActionStateWalk) {
            _velocity = ccp(direction.x * _walkSpeed, direction.y * _walkSpeed);
            if (_velocity.x >= 0) self.scaleX = 1.0;
            else self.scaleX = -1.0;
        }
}

-(void)update:(ccTime)dt {
    if (_actionState == kActionStateWalk) {
        _desiredPosition = ccpAdd(_position, ccpMult(_velocity, dt));
    }
}

-(BoundingBox)createBoundingBoxWithOrigin:(CGPoint)origin size:(CGSize)size
{
    BoundingBox boundingBox;
    boundingBox.original.origin = origin;
    boundingBox.original.size = size;
    boundingBox.actual.origin = ccpAdd(_position, ccp(boundingBox.original.origin.x, boundingBox.original.origin.y));
    boundingBox.actual.size = size;
    return boundingBox;
}

-(void)transformBoxes
{
    _hitBox.actual.origin = ccpAdd(_position, ccp(_hitBox.original.origin.x * _scaleX, _hitBox.original.origin.y * _scaleY));
    _hitBox.actual.size = CGSizeMake(_hitBox.original.size.width * _scaleX, _hitBox.original.size.height * _scaleY);
    _attackBox.actual.origin = ccpAdd(_position, ccp(_attackBox.original.origin.x * _scaleX, _attackBox.original.origin.y * _scaleY));
    _attackBox.actual.size = CGSizeMake(_attackBox.original.size.width * _scaleX, _attackBox.original.size.height * _scaleY);
}

-(void)setPosition:(CGPoint)position
{
    [super setPosition:position];
    [self transformBoxes];
}

@end
