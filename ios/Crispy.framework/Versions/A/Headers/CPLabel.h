//
//
//  Created by Harsh Jain on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CPLabelStyle;

enum CPLabelFormat {
    kCPText,
    kCPNumber,
    kCPMoney,
    kCPPercentage,
    kCPTime,
    kCPTimeElapsed
};


/**
 * Singleton to manage all label classes.
 */
@interface CPLabel : CCNode {
    CPLabelStyle *_style;
    CCNode<CCLabelProtocol, CCRGBAProtocol> *label;
    NSString *_format;
    NSString *_string;
    
    CGFloat amount;
    CGFloat delta;
    CGFloat oldAmount;
    
    CGFloat maxWidth;
    BOOL _multiLine;
    CPLabelFormat _formatStyle;
    CCTextAlignment _hAlign;
}

@property(nonatomic, retain) NSString *string;
@property(nonatomic, retain) CPLabelStyle *style;
@property(nonatomic, retain) NSString *format;
@property(nonatomic, assign) CPLabelFormat formatStyle;
@property(nonatomic, assign) BOOL multiLine;
@property(nonatomic, assign) CCTextAlignment hAlign;
@property(nonatomic, assign) GLubyte opacity;
@property(nonatomic, assign) ccColor3B color;

-(void)setLong:(long)n;
-(void)setLong:(long)n duration:(CGFloat)d;

-(void)updateDelta:(ccTime)dt;

-(int)intValue;
-(long)longValue;
-(BOOL)isUpdating;
-(void)countToZero;

+(CPLabel*)ttfLabelWithString:(NSString*)string font:(NSString*)font size:(int)size;
+(CPLabel*)labelWithString:(NSString*)string andStyle:(CPLabelStyle*)style;

-(id)initWithString:(NSString*)string
           andStyle:(CPLabelStyle*)style;

-(void)fitToWidth:(CGFloat)w;

+(NSString*)numberToString:(long)num style:(CPLabelFormat)style;
+(NSString*)chipsToString:(long)chips;

@end