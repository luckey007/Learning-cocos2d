//  
//  Event.h
//  Appytics
//  
//  Created by Harsh Jain on 8/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//  

#import <Foundation/Foundation.h>

@interface CPAnalytics : NSObject {
    double startTs;
    int localSessionId;
    NSMutableString *current;
    NSMutableDictionary *categories;
}

+(CPAnalytics*)sharedAnalytics;
-(void)startCategory:(NSString*)category;
-(void)endCategory:(NSString*)category;
-(void)startSession;
-(void)event:(NSString*)event;
-(void)event:(NSString *)event inCategory:(NSString*)category;
-(void)endSession;

@end
