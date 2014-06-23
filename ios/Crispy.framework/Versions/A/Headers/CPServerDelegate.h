//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CPServerDelegate<NSObject>

@optional

#pragma mark --
#pragma Connection methods

-(void)connected;
-(void)disconnected;

#pragma mark --
#pragma Master Methods

-(void)joinedGame:(NSString*)gameId;
-(void)leftGame:(NSString*)gameId;

#pragma mark --
#pragma In game methods

-(void)messageReceived:(NSDictionary*)message;

@end