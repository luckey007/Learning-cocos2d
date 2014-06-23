//
//  CPSportArena.h
//  sportsclassic
//
//  Created by Harsh Jain on 4/1/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

/**
 * Definition of an arena.
 */
@interface CPArena : NSObject<NSCopying> {
    NSString *_name;
    int _cost;
    int _level;
}

@property(nonatomic, retain) NSString *name;
@property(nonatomic, assign) int cost;
@property(nonatomic, assign) int level;

-(CCNode*)createPhoto;
-(CCNode*)createBackground;

-(BOOL)showFrame;

@end
