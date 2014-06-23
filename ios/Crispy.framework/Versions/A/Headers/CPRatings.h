//  
//  Event.h
//  Appytics
//  
//  Created by Harsh Jain on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//  

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

@class CPPopupStyle;

@interface CPRatings : NSObject<UIAlertViewDelegate> {
//    int showAfter;
//    int repeatAfter;
//    int maxPopups;
}   

+(CPRatings*)sharedRatings;

-(void)getAngry;


-(BOOL)shouldShow;

-(BOOL)show:(CPPopupStyle*)ps;

-(void)rate;

-(void)score:(int)n;

-(BOOL)hasRated;

-(void)more;

-(void)store:(NSString*)appId;


@end
