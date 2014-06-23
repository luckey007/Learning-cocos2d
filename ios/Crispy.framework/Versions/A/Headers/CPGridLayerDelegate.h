//
//  CPGridLayerDelegate.h
//  Crispy
//
//  Created by Harsh Jain on 5/19/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CPGridLayerDelegate <NSObject>

-(void)itemClicked:(CCNode*)item index:(int)i;

@end
