//
//  CPFrame.h
//  Crispy
//
//  Created by Harsh Jain on 4/24/14.
//  Copyright 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CPFrame : CCNode {
    CCSpriteBatchNode *frameMom;
}

-(id)initWithImage:(NSString*)img size:(CGSize)s goalWidth:(CGFloat)gw;

@end
