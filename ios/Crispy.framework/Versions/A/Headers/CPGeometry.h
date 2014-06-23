//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box2D.h"
#import "cocos2d.h"

#ifndef CP_GEOMETRY_H
#define CP_GEOMETRY_H

typedef struct {
    CGPoint p1;
    CGPoint p2;
} CPLine;

typedef struct {
    CGPoint p1;
    CGPoint p2;
} CPLineSegment;

CPLine CPLineCreateFromVector(b2Vec2 v, CGPoint p);
CPLine CPLineCreateFromPointAndAngle(CGPoint p, CGFloat a);
CPLine CPLineCreateFromPointAndPoint(CGPoint p1, CGPoint p2);
CGPoint CPLineIntersectsLine(CPLine l1, CPLine l2);
CGFloat CPDistanceBetweenLineAndPoint(CPLine l, CGPoint p);
int CPLineGetSide(CPLine l, CGPoint p);

CPLineSegment CPLineSegmentCreateFromPointAndPoint(CGPoint p1, CGPoint p2);
CGFloat CPDistanceBetweenLineSegmentAndPoint(CPLineSegment l, CGPoint p);
CGFloat CPAngleBetweenLineSegmentAndLineSegment(CPLineSegment l1, CPLineSegment l2);
CGFloat CPAngleBetweenVectors(CGPoint v1, CGPoint v2);
CGPoint CPShortestPointOnLineFromPoint(CPLine l, CGPoint p);
CGPoint CPGetPointOnLine(CPLine l, CGFloat t);

BOOL CPLineIntersectsLineSegment(CPLine l, CPLineSegment s);

CGRect CPRectFromCenter(CGPoint c, CGFloat w, CGFloat h);

#endif