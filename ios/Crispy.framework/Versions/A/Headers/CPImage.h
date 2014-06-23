//
//  CPImages.h
//  stranger
//
//  Created by Harsh Jain on 2/1/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CPImage : CCNode {
    CCSprite *sprite;
    CGSize size;
    int cornerSize;
}

-(id)initWithSize:(CGSize)s;
-(id)initWithSize:(CGSize)s rounded:(int)r;
-(void)setURL:(NSString*)url;
-(void)setData:(NSData*)data;
-(void)setSprite:(CCSprite*)s;

+(void)initCache;
+(void)closeCache;
+(void)clearCache;

-(void)setOpacity:(GLubyte)o;

@end

