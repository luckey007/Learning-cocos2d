//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@class GTMHTTPFetcher;

FOUNDATION_EXPORT NSString *const kCloudServerName;
FOUNDATION_EXPORT NSString *const kCloudServerPort;

/**
 * Singleton to manage all label classes.
 */
@interface CPCloud : NSObject {
    NSDictionary *dict;
    NSString *build;
    int version;
    NSString *cloudHost;
}

@property(nonatomic, readonly) int version;
@property(nonatomic, retain) NSString *cloudHost;

+(CPCloud*)cloud;

-(void)initialize;

-(NSString*)stringForKey:(NSString*)key def:(NSString*)d;
-(int)integerForKey:(NSString*)key def:(int)d;
-(long)longForKey:(NSString*)key def:(long)d;
-(CGFloat)floatForKey:(NSString*)key def:(CGFloat)d;

-(NSString*)stringForKey:(NSString *)key def:(NSString *)d ipad:(NSString*)di;
-(int)integerForKey:(NSString *)key def:(int)d ipad:(int)di;
-(long)longForKey:(NSString *)key def:(long)d ipad:(int)di;
-(CGFloat)floatForKey:(NSString *)key def:(CGFloat)d ipad:(CGFloat)di;

-(BOOL)hasKey:(NSString*)key;

@end