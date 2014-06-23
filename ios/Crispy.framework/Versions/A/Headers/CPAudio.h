//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import <AVFoundation/AVFoundation.h>

@interface CPAudio : NSObject {
    AVAudioPlayer *player;
}

-(id)initWithResource:(NSString*)res extension:(NSString*)ext;

-(void)start;
-(void)setVolume:(CGFloat)f;
-(void)pause;
-(void)once;
-(BOOL)isPlaying;

@end

