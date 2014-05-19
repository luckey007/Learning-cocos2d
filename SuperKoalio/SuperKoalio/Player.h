
#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Player : CCSprite 

@property (nonatomic, assign) CGPoint velocity;
@property (nonatomic, assign) CGPoint desiredPosition;
@property (nonatomic, assign) BOOL onGround;

-(void)update:(ccTime)dt;
-(CGRect)collisionBoundingBox;

@end
