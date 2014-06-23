//
//  SocketCommunicator.h
//  casino
//
//  Created by Kiran Bhivgade on 11/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPServerDelegate.h"
#import "CPSocketIODelegate.h"

@class CPSocketIO;

@interface CPServer : NSObject<CPSocketIODelegate> {
    NSString *host;
    int port;
    CPSocketIO *socket;
    NSMutableArray *delegates;
    NSString *gameId;
    NSString *userName;
    BOOL hasError;
    BOOL connected;
    
    BOOL connecting;
}

@property(nonatomic, readonly) BOOL connecting;
@property(nonatomic, retain) NSString* host;
@property(nonatomic, assign) int port;
@property(nonatomic, retain) NSString* userName;

+(CPServer*)sharedCPServer;

// The connect should be implemented in a fail-safe way. 
-(void)connect;
-(void)disconnect;

-(void)sendDictionary:(NSDictionary*)msg;
-(void)sendText:(NSString*)msg;
-(void)join:(NSString*)game;
-(void)leaveGame;

-(NSString*)currentGame;
-(BOOL)isConnected;

-(void)reconnect:(NSTimer*)timer;

-(void)addDelegate:(id<CPServerDelegate>)delegate;
-(void)removeDelegate:(id<CPServerDelegate>)delegate;
-(void)removeAllDelegates;

@end
