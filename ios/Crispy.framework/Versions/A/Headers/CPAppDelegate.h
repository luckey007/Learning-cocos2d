
//
//  AppDelegate.h
//  shootem2
//
//  Created by Harsh Jain on 4/13/13.
//  Copyright Crispy Games Private Limited 2013. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@class CPLabelStyle;
@class CPButtonStyle;
@class CPPopupStyle;

// Added only for iOS 6 support
@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end

@interface CPAppDelegate : NSObject <UIApplicationDelegate>
{
	UIWindow *window_;
	MyNavigationController *navController_;
	
	CCDirectorIOS *director_;							// weak ref
    
    double fps;

    UIInterfaceOrientation orientation;
}

@property (nonatomic, assign) UIInterfaceOrientation orientation;
@property (nonatomic, retain) UIWindow *window;
@property (readonly) MyNavigationController *navController;
@property (readonly) CCDirectorIOS *director;
@property (nonatomic, assign) double fps;

+(CPAppDelegate*)sharedDelegate;

-(void)launchScene:(CCScene*)scene;
-(void)launchSceneWithLayer:(CCLayer*)layer;
-(void)pushSceneWithLayer:(CCLayer*)layer;
-(void)pushScene:(CCScene*)scene;

-(CCLayer*)layerByTag:(int)t;

-(void)startGame;

-(BOOL)isPortrait;
-(BOOL)isLandscape;

-(void)cloudReloadedFromServer;

-(NSString*)applicationID;
-(NSString*)applicationName;

@end
