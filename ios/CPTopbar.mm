//
//  CPTopbar.m
//  lucky
//
//  Created by Lucky Lakhwani on 19/05/14.
//  Copyright 2014 Crispy Games Private Limited. All rights reserved.
//

#import "CPTopbar.h"

@implementation CPTopbar
- (id)init
{
    if (self = [super init]) {
        
        CGFloat W = [[CCDirector sharedDirector]winSize].width;
        CGFloat H = [[CCDirector sharedDirector]winSize].height;
        int n = [[CCDirector sharedDirector]interfaceOrientation];
        BOOL land = TRUE;
        if (n == 1) {
            land = FALSE;
        }
        
        CPSprite9 * base = [[CPSprite9 alloc]initWithFile:@"tb_base-hd.png" centreRegion:[CPUniversal rectForIPad:CGRectMake(15, 20,64 - 30 , 98 - 40)]];
        [base setContentSize:CGSizeMake(W,base.contentSize.height)];
        [self addChild:base];
        base.anchorPoint = ccp(0.5, 1);
        base.position = ccp(W / 2, H);
        
        
        CCSprite *buyBg = [CCSprite spriteWithFile:@"tb_buybg-hd.png"];
        buyBg.anchorPoint = ccp(0, 1);
        buyBg.position = ccp(0, base.contentSize.height);
        [base addChild:buyBg];
        
        CCSprite *bonusBg = [CCSprite spriteWithFile:@"top_bar-hd.png"];
        bonusBg.anchorPoint = ccp(0, 1);
        [base addChild:bonusBg];
       
        CCSprite *levelBase = [CCSprite spriteWithFile:@"tb_levelbase-hd.png"];
        levelBase.anchorPoint = ccp(0, 0.5);
        [base addChild:levelBase];

        CCSprite *progressLevel = [CCSprite spriteWithFile:@"tb_progress-hd.png"];
        progressLevel.anchorPoint = ccp(0, 0.5);
        [base addChild:progressLevel];
        
        
        CPButtonStyle *buyStyle = [CPButtonStyle style];
        buyStyle.normal = @"tb_btn_green-hd.png";
        buyStyle.ninePatch = YES;
        buyStyle.labelStyle = [CPLabelStyle style];
        buyStyle.labelStyle.font = @"Helvetica-Bold";
        buyStyle.labelStyle.ttf = YES;
        buyStyle.labelStyle.fontSize = [CPUniversal floatForIPad:18 andIPhone:9];
        buyStyle.touchOpacity = 200;

        CPButtonStyle *collectStyle = [CPButtonStyle styleWithStyle:buyStyle];
        collectStyle.normal = @"tb_btn_blue-hd.png";
        
        CPButtonStyle *lobbyStyle = [CPButtonStyle style];
        lobbyStyle.normal = @"tb_btn_red-hd.png";
        lobbyStyle.labelStyle = [CPLabelStyle style];
        lobbyStyle.labelStyle.font = @"Helvetica-Bold";
        lobbyStyle.labelStyle.fontSize = [CPUniversal floatForIPad:30 andIPhone:15];
        lobbyStyle.labelStyle.ttf = YES;
        lobbyStyle.touchOpacity = 200;

        CPButton *btnRed = [CPButton buttonWithStyle:lobbyStyle text:@"Lobby"];
        [base addChild:btnRed];
        btnRed.anchorPoint = ccp(1, 0.5);
        
        CPButton *btnGreen = [CPButton buttonWithStyle:buyStyle text:@"Buy Chips"];
        [buyBg addChild:btnGreen];
        btnGreen.anchorPoint = ccp(0, 0.5);
        btnGreen.position = ccp(btnGreen.contentSize.width / 2, btnGreen.contentSize.height + [CPUniversal floatForIPad:6 andIPhone:3]);
        
        CPButton *btnBlue = [CPButton buttonWithStyle:collectStyle text:@"Collect"];
        [bonusBg addChild:btnBlue];
        btnBlue.anchorPoint = ccp(0, 0.5);
        btnBlue.position = ccp(btnBlue.contentSize.width / 2, btnBlue.contentSize.height + [CPUniversal floatForIPad:8 andIPhone:5]);
        
        CPLabelStyle *lblStyle = [CPLabelStyle style];
        lblStyle.font = @"Helvetica-Bold";
        lblStyle.ttf = YES;
        lblStyle.fontSize = [CPUniversal floatForIPad:30 andIPhone:15];
        
        CPLabel *level = [CPLabel labelWithString:@"Level 1" andStyle:lblStyle];
        [base addChild:level];
        level.anchorPoint = ccp(0, 0.5);
        
        CPLabelStyle *chipsStyle = [CPLabelStyle style];
        chipsStyle.font = @"Helvetica-Bold";
        chipsStyle.ttf = YES;
        chipsStyle.fontSize = [CPUniversal floatForIPad:20 andIPhone:10];

        CPLabel *chips = [CPLabel labelWithString:@"2k" andStyle:chipsStyle];
        [buyBg addChild:chips];
        chips.anchorPoint = ccp(0.5, 0);
        chips.position = ccp(buyBg.contentSize.width - [CPUniversal floatForIPad:50 andIPhone:25], buyBg.contentSize.height / 2 + [CPUniversal floatForIPad:10 andIPhone:5]);
        
        CPLabel *collectChips = [CPLabel labelWithString:@"500" andStyle:chipsStyle];
        [bonusBg addChild:collectChips];
        collectChips.anchorPoint = ccp(0.5, 0);
        collectChips.position = ccp(bonusBg.contentSize.width - [CPUniversal floatForIPad:50 andIPhone:25], buyBg.contentSize.height / 2 + [CPUniversal floatForIPad:10 andIPhone:5]);
        
        
        if (land) {
            
            bonusBg.position = ccp(buyBg.contentSize.width - [CPUniversal floatForIPad:5 andIPhone:5], base.contentSize.height);
            
            
            levelBase.position = ccp(buyBg.contentSize.width + bonusBg.contentSize.width - [CPUniversal floatForIPad:-20 andIPhone:-10], base.contentSize.height / 2 + [CPUniversal floatForIPad:20 andIPhone:10]);
            
            
            progressLevel.position = ccp(buyBg.contentSize.width + bonusBg.contentSize.width - [CPUniversal floatForIPad:-20 andIPhone:-10], base.contentSize.height / 2 + [CPUniversal floatForIPad:20 andIPhone:10]);
            
            level.position = ccp(buyBg.contentSize.width + bonusBg.contentSize.width - [CPUniversal floatForIPad:-40 andIPhone:-20], base.contentSize.height / 2 + [CPUniversal floatForIPad:20 andIPhone:10]);
            
            
            btnRed.position = ccp(W - [CPUniversal floatForIPad:30 andIPhone:15], base.contentSize.height / 2 + [CPUniversal floatForIPad:20 andIPhone:10]);
            
        }else{
            
            bonusBg.position = ccp(buyBg.contentSize.width - [CPUniversal floatForIPad:5 andIPhone:10], base.contentSize.height);
            
            
            levelBase.position = ccp(buyBg.contentSize.width + bonusBg.contentSize.width - [CPUniversal floatForIPad:-10 andIPhone:12], base.contentSize.height / 2 + [CPUniversal floatForIPad:20 andIPhone:10]);
            
            
            progressLevel.position = ccp(buyBg.contentSize.width + bonusBg.contentSize.width - [CPUniversal floatForIPad:-10 andIPhone:12], base.contentSize.height / 2 + [CPUniversal floatForIPad:20 andIPhone:10]);
            
            level.position = ccp(buyBg.contentSize.width + bonusBg.contentSize.width - [CPUniversal floatForIPad:-35 andIPhone:-5], base.contentSize.height / 2 + [CPUniversal floatForIPad:20 andIPhone:10]);
            
            
            btnRed.position = ccp(W - [CPUniversal floatForIPad:15 andIPhone:0], base.contentSize.height / 2 + [CPUniversal floatForIPad:20 andIPhone:10]);
        }
        
        

    }
    return self;
}


@end
