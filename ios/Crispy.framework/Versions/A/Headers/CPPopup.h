//
//  CPPopup.h
//  Crispy
//
//  Created by Harsh Jain on 4/28/14.
//  Copyright 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import <Crispy/Crispy.h>

enum PopupAction {
    kPopupOk=0,
    kPopupCancel=1,
    kPopupCross=2
};


@class CPPopupStyle;

@interface CPPopup : CCLayer {
    CPPopupStyle *popStyle;
    
    SEL callback;
    id target;
}

-(id)initWithStyle:(CPPopupStyle*)style title:(NSString*)title
           message:(NSString*)message
         cancelBtn:(NSString*)cancel
             okBtn:(NSString*)ok
         showCross:(BOOL)cross;

// popup:(PopupAction)action;
-(void)setCallback:(SEL)cb target:(id)t;

@end
