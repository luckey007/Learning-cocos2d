//
//  CPGridLayer.h
//  Crispy
//
//  Created by Harsh Jain on 5/19/14.
//  Copyright 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CPScrollLayer.h"
#import "CPGridLayerDelegate.h"

@interface CPGridLayer : CPScrollLayer {
    CGFloat _paddingX;
    CGFloat _paddingY;
    CGFloat _cellWidth;
    CGFloat _cellHeight;
    int numPerCol;
    CGFloat SX;
    CGFloat SY;
    id<CPGridLayerDelegate> _delegate;
    
}

-(id)initWithDirection:(enum CPScrollDirection)d;

-(void)redraw;

@property(nonatomic, retain) id<CPGridLayerDelegate> delegate;
@property(nonatomic, assign) CGFloat cellWidth;
@property(nonatomic, assign) CGFloat cellHeight;
@property(nonatomic, assign) CGFloat paddingX;
@property(nonatomic, assign) CGFloat paddingY;

@end
