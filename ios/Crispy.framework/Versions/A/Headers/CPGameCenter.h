//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

/**
 * Singleton to manage all label classes.
 */
@interface CPGameCenter : NSObject<GKGameCenterControllerDelegate> {
    BOOL enabled;
    BOOL _ready;
}

@property(nonatomic, readonly) BOOL ready;

+(CPGameCenter*)sharedCPGameCenter;

-(void)enable;
-(void)gameReady;
-(void)showLeaderboard:(NSString*)leaderboardId;
-(void)reportScore:(int)s leaderboard:(NSString*)leaderboardId;
-(int)getScore:(NSString*)leaderboardId;

@end