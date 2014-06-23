//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CPAttachment : NSObject {
    CCSprite *image;
    int z;
    CGPoint offset;
}

+(id)attachmentWithImage:(NSString*)image z:(int)z offset:(CGPoint)o;
+(id)attachmentWithSprite:(CCSprite*)sprite z:(int)z offset:(CGPoint)o;
-(id)initWithSprite:(CCSprite*)image z:(int)z offset:(CGPoint)o;

@property(nonatomic, readonly) CCSprite *image;
@property(nonatomic, readonly) int z;
@property(nonatomic, readonly) CGPoint offset;

@end

