//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GADBannerViewDelegate.h"

@class GADBannerView;

/**
 * Singleton to manage all label classes.
 */
@interface CPBanner : NSObject<GADBannerViewDelegate> {
    GADBannerView *admobBanner;
    NSString *admobId;
    BOOL showing;
}

+(CPBanner*)sharedBanner;

-(void)show;
-(void)hide;

-(void)setId:(NSString*)admobId;

@end