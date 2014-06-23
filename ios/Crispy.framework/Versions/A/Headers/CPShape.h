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

@protocol CPShape <NSObject>

-(BOOL)contains:(CGPoint)p;
-(void)createFixture:(b2FixtureDef*)def onBody:(b2Body*)body;
-(void)createGlobalFixture:(b2FixtureDef*)def onBody:(b2Body*)body;
-(CGRect)boundingBox;
-(CGPoint)origin;
-(CGPoint)nearestPointTo:(CGPoint)p;

@end

@interface CPRectShape : NSObject<CPShape> {
    CGRect rect;
    CGFloat angle;
}

+(id)shapeWithRect:(CGRect)r angle:(CGFloat)a;
-(id)initWithRect:(CGRect)r angle:(CGFloat)a;

@end

@interface CPDiscShape : NSObject<CPShape> {
    CGPoint center;
    CGFloat radius;
}

+(id)shapeWithCenter:(CGPoint)c radius:(CGFloat)r;
-(id)initWithCenter:(CGPoint)c radius:(CGFloat)r;

@end

@interface CPCircularRodShape : NSObject<CPShape> {
    CGPoint origin;
    CGFloat radius;
    CGFloat start;
    CGFloat end;
    CGFloat width;
}

+(id)shapeWithOrigin:(CGPoint)o radius:(CGFloat)r start:(CGFloat)s
                end:(CGFloat)e width:(CGFloat)w;
-(id)initWithOrigin:(CGPoint)o radius:(CGFloat)r start:(CGFloat)s
                end:(CGFloat)e width:(CGFloat)w;

@end

@interface CPRodShape : NSObject<CPShape> {
    CGPoint start;
    CGPoint end;
    CGFloat width;
}

-(id)initWithStart:(CGPoint)s end:(CGPoint)e width:(CGFloat)w;

+(id)shapeWithStart:(CGPoint)s end:(CGPoint)e width:(CGFloat)w;

@end

@interface CPChainShape : NSObject<CPShape> {
    b2Vec2 *points;
    int _N;
    int _c;
}

+(id)shapeWithOrigin:(CGPoint)o points:(NSString*)pts;
+(id)shapeWithCapacity:(int)N;
-(id)initWithCapacity:(int)N;
-(void)addPoint:(CGPoint)p;
-(void)transformY:(CGFloat)H;

@end
