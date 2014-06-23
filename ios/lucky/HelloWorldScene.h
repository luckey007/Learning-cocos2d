//
//  HelloWorldScene.h
//  lucky
//
//  Created by Lucky Lakhwani on 10/06/14.
//  Copyright 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface HelloWorldScene : CCLayerColor
{
    NSMutableArray *chips, *winningComboX, *winningComboY;
	int turn, win;
	BOOL gameEnd, isAnimating;
	CCSprite *turnArrow;
}

@property (nonatomic, retain) CCSprite *turnArrow;
// returns a Scene that contains the HelloWorld as the only child
+(id) scene;
-(void) drawBoard;
-(void) checkIfWin:(int)row withCol: (int)col withPlayer: (int)pl;
-(void) spriteMoveFinished:(id)sender data: (id)toRemove;
-(void) checkWinnerRow:(int)x withCol: (int)y withDirection: (int)dir withPlayer: (int)pl;
-(void) highlightWinningPieces:(id)sender;
-(void) changeTurnArrow:(id)sender;
-(void) announceWinner;


@end
