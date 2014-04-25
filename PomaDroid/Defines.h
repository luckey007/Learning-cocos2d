//
//  Defines.h
//  PomaDroid
//
//  Created by Lucky Lakhwani on 18/04/14.
//  Copyright (c) 2014 Lucky Lakhwani. All rights reserved.
//

#ifndef PomaDroid_Defines_h
#define PomaDroid_Defines_h

#define SCREEN [[CCDirector sharedDirector] winSize]
#define CENTER ccp(SCREEN.width / 2, SCREEN.height / 2)
#define CURTIME CACurrentMediaTime()

#define random_range(low,high) (arc4random()%(high-low+1))+low
#define frandom (float)arcrandom()/UINT64_C(0x100000000)
#define frandom_range(low,high) ((high-low)*frandom)+low

typedef enum _ActionState{
    kActionStateNone = 0,
    kActionStateIdle,
    kActionStateAttack,
    kActionStateWalk,
    kActionStateHurt,
    kActionStateKnockedOut
    
}ActionState;

typedef struct _BoundingBox{
    CGRect actual;
    CGRect original;
    
}BoundingBox;

#endif
