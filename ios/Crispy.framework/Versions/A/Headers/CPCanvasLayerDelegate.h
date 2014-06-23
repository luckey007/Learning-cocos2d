//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CPCanvasLayerDelegate<NSObject>

@optional

-(void)lineFrom:(CGPoint)s to:(CGPoint)e;

@end