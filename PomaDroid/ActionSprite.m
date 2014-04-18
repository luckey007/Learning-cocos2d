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

-(void)hurtWithDamage:(float)damage{
    
}

-(void)knockout{
    
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

@end
