//  
//  CPRoundedButton.h
//  Mazes2
//  
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//  
    
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CPCanvasLayerDelegate.h"

@interface CPCanvasLayer : CCLayer {
    CCSprite *brush;
    CCRenderTexture *texture;
    CGRect box;
    
    id<CPCanvasLayerDelegate> delegate;
}   

@property(nonatomic, retain) id<CPCanvasLayerDelegate> delegate;

-(id)initWithDrawingArea:(CGRect)r;

-(void)setBrushColor:(ccColor3B)c;
-(void)setBrushSize:(CGFloat)r;

-(void)drawLineFrom:(CGPoint)start to:(CGPoint)end;

-(void)publishWidth:(int)w callback:(void(^)(NSString*))cb;


@end
    