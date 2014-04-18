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

-(void)walkWithDirection:(CGPoint)direction{
    
}

-(void)update:(ccTime)dt{
    
}

@end
