//
//  CPEvent.h
//  Crispy
//
//  Created by Harsh Jain on 5/21/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPEvent : NSObject {
    NSString *_type;
    // On a scale of 1-to-10 1 => Worst, 5 => Neutral, 10=> Awesome.
    int _score;
}

@property(nonatomic, retain) NSString *type;
@property(nonatomic, assign) int score;

@end
