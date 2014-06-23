//
//  CPCoinsSupport.h
//  Crispy
//
//  Created by Harsh Jain on 5/13/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CPCoinsSupport <NSObject>

-(long)totalChips;
-(long)getChips:(long)N;
-(void)addChips:(long)N;

@end
