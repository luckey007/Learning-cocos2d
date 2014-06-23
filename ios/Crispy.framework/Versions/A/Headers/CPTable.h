//
//  CPTable.h
//  Crispy
//
//  Created by Harsh Jain on 3/30/14.
//  Copyright 2014 Crispy Games Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CPCell : CCNode {
    CCNode *_widget;
    
    int _row;
    int _col;
    BOOL _endRow;
    
    float _minWidth;
    float _maxWidth;
    float _prefWidth;
    
    float _minHeight;
    float _maxHeight;
    float _prefHeight;
    
    float _computedWidth;
    float _computedHeight;
}

@property(nonatomic, assign) int row;
@property(nonatomic, assign) int col;
@property(nonatomic, assign) BOOL endRow;

@property(nonatomic, assign) float minWidth;
@property(nonatomic, assign) float maxWidth;
@property(nonatomic, assign) float prefWidth;

@property(nonatomic, assign) float minHeight;
@property(nonatomic, assign) float maxHeight;
@property(nonatomic, assign) float prefHeight;

@property(nonatomic, assign) float computedWidth;
@property(nonatomic, assign) float computedHeight;

-(CPCell*)colspan:(int)c;

/**
 * Padding.
 */
-(CPCell*)padLeft:(float)p;
-(CPCell*)padRight:(float)p;
-(CPCell*)padTop:(float)p;
-(CPCell*)padBottom:(float)p;

-(CPCell*)pad:(float)p;


/**
 * Expand the cell
 */
-(CPCell*)expandX;
-(CPCell*)expandY;
-(CPCell*)expand;

/**
 * Align the widget inside the cell
 */
-(CPCell*)left;
-(CPCell*)bottom;
-(CPCell*)top;
-(CPCell*)right;

/**
 * Expand the widget.
 */
-(CPCell*)fillX;
-(CPCell*)fillY;
-(CPCell*)fill;

/**
 * Min/Max/Pref size of the widget.
 */
-(CPCell*)minWidth:(float)w;
-(CPCell*)maxWidth:(float)w;
-(CPCell*)prefWidth:(float)w;

-(CPCell*)minHeight:(float)h;
-(CPCell*)maxHeight:(float)h;
-(CPCell*)prefHeight:(float)h;

-(CPCell*)width:(float)w;
-(CPCell*)height:(float)h;

@end

@interface CPTable : CCNode {
    NSMutableArray *_cells;
    float _width;
    float _height;
    CCDrawNode *_debug;
    
    CCNode *_table;
    BOOL _widthSet;
    BOOL _heightSet;
}

-(id)init;

-(void)debug;

-(CPCell*)add:(CCNode*)node;

-(CPTable*)right;
-(CPTable*)left;
-(CPTable*)bottom;
-(CPTable*)top;

-(CPTable*)setFillParent:(BOOL)f;
-(CPTable*)width;
-(CPTable*)height;

@end
