//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CPSocketIODelegate<NSObject>

-(void)receivedMessage:(NSString*)message;
-(void)connectionFailed:(NSError*)error;

@end