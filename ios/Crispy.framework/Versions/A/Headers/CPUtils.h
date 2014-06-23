//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CPUtils : NSObject {

}

+(CGPoint)pointFromTouch:(UITouch*)touch;
+(CGPoint)previousPointFromTouch:(UITouch*)touch;
+(CGPoint)randomPointInRect:(CGRect)r;

+(NSString*)uniqueID;

+(void)logRect:(CGRect)r;
+(void)logPoint:(CGPoint)p;
+(void)logSize:(CGSize)s;

+(CGPoint)normalizedPoint:(CGPoint)p length:(CGFloat)l;

+(NSString*)stringForSeconds:(int)s;
+(void)shuffle:(NSMutableArray*)a;

+(NSString*)hexEncode:(NSData*)data;

+(NSString*)dictionary:(NSDictionary*)d stringFor:(NSString*)key def:(NSString*)def;
+(int)dictionary:(NSDictionary*)d intFor:(NSString*)key def:(int)def;
+(long)dictionary:(NSDictionary*)d longFor:(NSString*)key def:(long)def;
+(CGFloat)dictionary:(NSDictionary*)d floatFor:(NSString*)key def:(CGFloat)def;

+(NSString*)trimString:(NSString*)s length:(int)l;

+(NSString*)applicationDocumentsDirectory;

+(void)drawRectangle:(CGRect)r color:(ccColor4F)color width:(CGFloat)w node:(CCDrawNode*)canvas;

+(long)stringToChips:(NSString*)p;
+(CGPoint)pointFromString:(NSString*)s;

+(void)alert:(NSString*)title message:(NSString*)message;

@end
