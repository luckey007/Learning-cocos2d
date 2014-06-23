//
//  CPBuyDelegate.h
//  Crispy
//
//  Created by Harsh Jain on 4/7/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@protocol CPBuyDelegate <NSObject>

-(void)purchaseSuccess:(NSString*)productId;
-(void)purchaseFailed:(NSString*)productId;

@end
