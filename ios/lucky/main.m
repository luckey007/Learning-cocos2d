//
//  main.m
//  lucky
//
//  Created by Harsh Jain on 4/7/14.
//  Copyright Crispy Games Private Limited 2014. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"Connect4AppDelegate");
    [pool release];
    return retVal;
}
