//
//  GameOverLayer.h
//  example
//
//  Created by Lucky Lakhwani on 01/04/14.
//  Copyright (c) 2014 Lucky Lakhwani. All rights reserved.
//

#import "cocos2d.h"

@interface GameOverLayer : CCLayerColor{
    
}

+(CCScene *) sceneWithWon:(BOOL)won;
-(id)initWithWon:(BOOL)won;
@end
