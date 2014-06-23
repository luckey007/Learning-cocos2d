//
//  NSObject+CPEventSupport.h
//  Crispy
//
//  Created by Harsh Jain on 5/21/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CPArena;
@class CPEvent;

@protocol CPEventSupport<NSObject>

-(void)reportEvent:(CPEvent*)event inArena:(CPArena*)arena;
-(void)closeGame;

@end

