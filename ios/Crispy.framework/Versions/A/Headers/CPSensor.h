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

@class CPObject;

@interface CPSensor : NSObject {
    int tag;
    NSMutableArray* shapes;
    
    SEL callback;
    id target;
    
    BOOL passSensor;
    BOOL passActor;
    BOOL passShape;
}

+(id)sensorWithSelector:(SEL)callback target:(id)t;
-(id)initWithSelector:(SEL)callback target:(id)t;
-(void)addShape:(id<CPShape>)s;

-(void)detectInside:(CPObject*)a;

-(void)removeAllShapes;

@property(nonatomic, assign) int tag;

@end
