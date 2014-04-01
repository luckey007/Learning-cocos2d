//
//  HelloWorldLayer.h
//  example
//
//  Created by Lucky Lakhwani on 28/03/14.
//  Copyright Lucky Lakhwani 2014. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "GameOverLayer.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor {
    
    NSMutableArray  *_monsters;
    NSMutableArray  *_projectiles;
    int             monsterDestroyed;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
