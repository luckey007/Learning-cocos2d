//
//  CPInApp.h
//  Crispy
//
//  Created by Harsh Jain on 4/7/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "cocos2d.h"
#import "CPBuyDelegate.h"

@interface CPBuy : NSObject<SKProductsRequestDelegate, SKPaymentTransactionObserver> {
    NSMutableDictionary *_products;
    NSMutableArray *_pendingProducts;
    NSMutableSet *_invalidProductIds;
    
    id<CPBuyDelegate> delegate;
    BOOL updatingProducts;
    NSTimer *timer;
    
    CCScene *pleaseWaitScene;
}

@property(nonatomic, retain) id<CPBuyDelegate> delegate;

+(CPBuy*)buy;

-(void)initialize;

-(void)addProduct:(NSString*)productId;

-(BOOL)isPurchased:(NSString*)productId;
-(void)purchase:(SKProduct*)product;

-(SKProduct*)productForId:(NSString*)productId;

-(void)restorePurchases;

-(void)update:(NSTimer*)timer;

@end
