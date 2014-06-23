//
//  CPRoundedButton.h
//  Mazes2
//
//  Created by Kiran Bhivgade on 11/14/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GADInterstitialDelegate.h"
#import <ApplifierImpact/ApplifierImpact.h>

@class GADInterstitial;

enum AdType {
    ADMOB=0,
    APPLIFIER=1,
    AD_NONE=2
    };

/**
 * Singleton to manage all label classes.
 */
@interface CPInterstitial : NSObject<GADInterstitialDelegate, ApplifierImpactDelegate> {
    BOOL enabled;
    AdType type;
    GADInterstitial *admobInterstitial;
    
    NSString *admobId;
    NSString *applifierId;
    
    BOOL loading;
}

+(CPInterstitial*)sharedInterstitial;

-(void)enable;
-(void)disable;

-(void)load;

-(void)setAdmobId:(NSString*)admobId;
-(void)setApplifierId:(NSString*)applifierId;

@end