//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CPUniversal : NSObject {

}

+(CGPoint)center;
+(CGPoint)percentageToPixel:(CGPoint)p;

/**
 * Point in IPad coordinate system. IPhone stuff are halfed
 */
+(CGPoint)pointForIPad:(CGPoint)p1;
+(CGFloat)floatForIPad:(CGFloat)f1;
+(int)intForIPad:(int)i1;
+(CGRect)rectForIPad:(CGRect)r;
+(CGSize)sizeForIPad:(CGSize)s;
+(CGPoint)percentX:(CGFloat)x andYIPad:(CGFloat)y;
+(CGPoint)percentY:(CGFloat)y andXIPad:(CGFloat)x;


/**
 * Point in IPhone coordinate system. Ipad stuff are doubled.
 */
+(CGPoint)pointForIPhone:(CGPoint)p1;
+(CGFloat)floatForIPhone:(CGFloat)f1;
+(int)intForIPhone:(int)i1;
+(CGRect)rectForIPhone:(CGRect)r;
+(CGSize)sizeForIPhone:(CGSize)s;
+(CGPoint)percentX:(CGFloat)x andYIPhone:(CGFloat)y;
+(CGPoint)percentY:(CGFloat)y andXIPhone:(CGFloat)x;


// DEPRECATED SHIT
+(CGSize)fullSize;
+(void)fullScreen:(CCSprite*)s;

+(CGPoint)percentageX:(CGFloat)x andYIPad:(CGFloat)y1 andIPhone:(CGFloat)y2;
+(CGPoint)percentageX:(CGFloat)x andYIPad:(CGFloat)y1 andIPhone:(CGFloat)y2 andIPhone5:(CGFloat)y3;

+(CGPoint)percentageY:(CGFloat)y andXIPad:(CGFloat)x1 andIPhone:(CGFloat)x2;
+(CGPoint)percentageX:(CGFloat)x andY:(CGFloat)y;
+(CGPoint)percentageY:(CGFloat)y andX:(CGFloat)x;
+(CGPoint)mirrorX:(CGPoint)p;
+(CGPoint)mirrorY:(CGPoint)p;

+(CGPoint)pointForIPad:(CGPoint)p1 andIPhone:(CGPoint)p2;
+(CGPoint)pointForIPad:(CGPoint)p1 andIPhone:(CGPoint)p2 andRetina:(CGPoint)p3;
+(CGPoint)pointForIPad:(CGPoint)p1 andIPhone:(CGPoint)p2 andIPhone5:(CGPoint)p3;
+(CGPoint)pointForIPad:(CGPoint)p1 andIPhone:(CGPoint)p2 andRetina:(CGPoint)p3 andIPhone5:(CGPoint)p4;

+(CGPoint)pointRightForIPad:(CGPoint)p1 andIPhone:(CGPoint)p2;
+(CGPoint)pointTopForIPad:(CGPoint)p1 andIPhone:(CGPoint)p2;
+(CGPoint)pointCenterForIPad:(CGPoint)p1 andIPhone:(CGPoint)p2;


+(CGPoint)pointWithX:(CGFloat)x andYForIPad:(CGFloat)y1 andIPhone:(CGFloat)y2;
+(CGPoint)pointWithY:(CGFloat)y andXForIPad:(CGFloat)x1 andIPhone:(CGFloat)x2;

+(CGPoint)pointWithX:(CGFloat)x andYForIPad:(CGFloat)y1 andIPhone:(CGFloat)y2 andIPhone5:(CGFloat)y3;
+(CGPoint)pointWithY:(CGFloat)y andXForIPad:(CGFloat)x1 andIPhone:(CGFloat)x2 andIPhone5:(CGFloat)x3;

+(CGSize)sizeForIPad:(CGSize)s1 andIPhone:(CGSize)s2;
+(CGSize)sizeForIPad:(CGSize)s1 andIPhone:(CGSize)s2 andRetina:(CGSize)s3;

+(CGRect)rectForIPad:(CGRect)r1 andIPhone:(CGRect)r2;
+(CGRect)rectForIPad:(CGRect)r1 andIPhone:(CGRect)r2 andRetina:(CGRect)r3;
+(CGRect)rectForIPad:(CGRect)r1 andIPhone:(CGRect)r2 andIPhone5:(CGRect)r3;

+(CGFloat)floatForIPad:(CGFloat)f1 andIPhone:(CGFloat)f2;
+(CGFloat)floatForIPad:(CGFloat)f1 andIPhone:(CGFloat)f2 andIPhone5:(CGFloat)f3;
+(CGFloat)floatForIPad:(CGFloat)f1 andIPhone:(CGFloat)f2 andRetina:(CGFloat)f3;

+(NSInteger)intForIPad:(int)i1 andIPhone:(int)i2;
+(NSInteger)intForIPad:(int)i1 andIPhone:(int)i2 andIPhone5:(int)i3;
+(NSInteger)intForIPad:(int)i1 andIPhone:(int)i2 andRetina:(int)i3;

+(NSString*)stringForIPad:(NSString*)s1 andIPhone:(NSString*)s2;

+(CCLabelBMFont*)labelBMFontWithText:(NSString*)text fontFile:(NSString*)fntFile;

+(BOOL)isRetinaIPhone;

+(void)justify:(CGPoint)anchor spacing:(CGFloat)spacing layout:(BOOL)horizontal buttons:(CCNode*)node,... NS_REQUIRES_NIL_TERMINATION;

@end
