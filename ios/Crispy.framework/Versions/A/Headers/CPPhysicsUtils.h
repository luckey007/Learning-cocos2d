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

@interface CPPhysicsUtils : NSObject {

}

+(b2Vec2)cgPointTob2Vec2:(CGPoint)p;
+(CGPoint)b2Vec2ToCgPoint:(b2Vec2)v;
+(CGFloat)angleBetweenVectorOne:(b2Vec2)v1 andTwo:(b2Vec2)v2;

@end
