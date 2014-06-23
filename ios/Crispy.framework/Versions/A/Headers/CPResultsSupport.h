//
//  CPResultsSupport.h
//  Crispy
//
//  Created by Harsh Jain on 5/13/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CPArena;
@class CPResult;

@protocol CPResultsSupport <NSObject>

-(void)gameOver:(CPArena*)arena result:(CPResult*)result;

@end
