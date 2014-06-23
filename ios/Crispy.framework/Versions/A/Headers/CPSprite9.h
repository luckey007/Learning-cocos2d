//
//  CPSprite9.h
//  Crispy
//
//  Created by Harsh Jain on 4/14/14.
//  Copyright 2014 Crispy Games Private Limited. All rights reserved.
//

#import "cocos2d.h"

@interface CPSprite9 : CCNode <CCRGBAProtocol> {
    CGRect  rect_;
    
	CCSpriteBatchNode *scale9Image;
	CCSprite *topLeft;
	CCSprite *top;
	CCSprite *topRight;
	CCSprite *left;
	CCSprite *centre;
	CCSprite *right;
	CCSprite *bottomLeft;
	CCSprite *bottom;
	CCSprite *bottomRight;
    
	// texture RGBA
	GLubyte	opacity;
	ccColor3B color;
	BOOL opacityModifyRGB_;
    
}

-(id)initWithBatch:(CCSpriteBatchNode*)batch
             rect:(CGRect)rect
     centreRegion:(CGRect)centreRegion;

-(id)initWithFile:(NSString*)file
     centreRegion:(CGRect)centre;

-(id)initWithFile:(NSString *)file
       paddingTop:(float)pTop
            right:(float)pRight
           bottom:(float)pBottom
             left:(float)pLeft;

/** conforms to CocosNodeRGBA protocol */
@property (nonatomic,readwrite) GLubyte opacity;
/** conforms to CocosNodeRGBA protocol */
@property (nonatomic,readwrite) ccColor3B color;

@end
