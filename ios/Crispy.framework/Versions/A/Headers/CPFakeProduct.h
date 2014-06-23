//
//  CPFakeProduct.h
//  Crispy
//
//  Created by Harsh Jain on 4/11/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <StoreKit/StoreKit.h>

@interface CPFakeProduct : SKProduct {
    NSString *_productId;
    NSDecimalNumber *_price;
    NSLocale *_locale;
}

-(id)initWithProductId:(NSString*)productId;

@end
