//
//  CPTwoplayerGameResult.h
//  sportsclassic
//
//  Created by Harsh Jain on 4/1/14.
//  Copyright (c) 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPResult : NSObject {
    BOOL _computer;
    int _scoreOne;
    int _scoreTwo;
    double _totalTime;
    int _difficulty;
}

@property(nonatomic, assign) BOOL computer;
@property(nonatomic, assign) int scoreOne;
@property(nonatomic, assign) int scoreTwo;
@property(nonatomic, assign) double totalTime;
@property(nonatomic, assign) int difficulty;

@end
