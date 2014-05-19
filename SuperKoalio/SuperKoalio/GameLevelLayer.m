


#import "GameLevelLayer.h"
#import "Player.h"

@interface GameLevelLayer() 
{
    CCTMXTiledMap *map;
    Player *player;
    CCTMXLayer *walls;
}

@end


@implementation GameLevelLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	GameLevelLayer *layer = [GameLevelLayer node];
	[scene addChild: layer];
	return scene;
}


-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        CCLayerColor *blueSky = [[CCLayerColor alloc] initWithColor:ccc4(100, 100, 250, 255)];
        [self addChild:blueSky];
        
        map = [[CCTMXTiledMap alloc] initWithTMXFile:@"level1.tmx"];
        [self addChild:map];
        
        walls = [map layerNamed:@"walls"];
        
        player = [[Player alloc] initWithFile:@"koalio_stand.png"];
        player.position = ccp(200 , 200);
        [map addChild:player z:15];
        
        [self schedule:@selector(update:)];
        
    }
	return self;
}

-(void)update:(ccTime)dt 
{
    [player update:dt];
    [self checkForAndResolveCollisions:player];
}

- (CGPoint)tileCoordForPosition:(CGPoint)position 
{
    float x = floor(position.x / map.tileSize.width);
    float levelHeightInPixels = map.mapSize.height * map.tileSize.height;
    float y = floor((levelHeightInPixels - position.y) / map.tileSize.height);
    return ccp(x, y);
}

-(CGRect)tileRectFromTileCoords:(CGPoint)tileCoords
{
    float levelHeightInPixels = map.mapSize.height * map.tileSize.height;
    CGPoint origin = ccp(tileCoords.x * map.tileSize.width, levelHeightInPixels - ((tileCoords.y + 1) * map.tileSize.height));
    return CGRectMake(origin.x, origin.y, map.tileSize.width, map.tileSize.height);
}



-(NSArray *)getSurroundingTilesAtPosition:(CGPoint)position forLayer:(CCTMXLayer *)layer {
    
    CGPoint plPos = [self tileCoordForPosition:position];
    
    NSMutableArray *gids = [NSMutableArray array];
    
    for (int i = 0; i < 9; i++) {
        int c = i % 3;
        int r = (int)(i / 3);
        CGPoint tilePos = ccp(plPos.x + (c - 1), plPos.y + (r - 1));
        
        int tgid = [layer tileGIDAt:tilePos];
        
        CGRect tileRect = [self tileRectFromTileCoords:tilePos];
        
        NSDictionary *tileDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithInt:tgid], @"gid",
                                  [NSNumber numberWithFloat:tileRect.origin.x], @"x",
                                  [NSNumber numberWithFloat:tileRect.origin.y], @"y",
                                  [NSValue valueWithCGPoint:tilePos],@"tilePos",
                                  nil];
        [gids addObject:tileDict];
        
    }
    
    [gids removeObjectAtIndex:4];
    [gids insertObject:[gids objectAtIndex:2] atIndex:6];
    [gids removeObjectAtIndex:2];
    [gids exchangeObjectAtIndex:4 withObjectAtIndex:6];
    [gids exchangeObjectAtIndex:0 withObjectAtIndex:4];
    

    return (NSArray *)gids;
}


-(void)checkForAndResolveCollisions:(Player *)p {
    NSArray *tiles = [self getSurroundingTilesAtPosition:p.position forLayer:walls ];
    
    for (NSDictionary *dic in tiles) {
        CGRect pRect = [p collisionBoundingBox];
        
        int gid = [[dic objectForKey:@"gid"] intValue];
        
        if (gid) {
            CGRect tileRect = CGRectMake([[dic objectForKey:@"x"] floatValue], [[dic objectForKey:@"y"] floatValue], map.tileSize.width, map.tileSize.height);
            if (CGRectIntersectsRect(pRect, tileRect)) {
                CGRect intersection = CGRectIntersection(pRect, tileRect);
                
                int tileIndx = [tiles indexOfObject:dic];
                
                if (tileIndx == 0) {
                    //tile is directly below Koala
                    p.desiredPosition = ccp(p.desiredPosition.x, p.desiredPosition.y + intersection.size.height);
                } else if (tileIndx == 1) {
                    //tile is directly above Koala
                    p.desiredPosition = ccp(p.desiredPosition.x, p.desiredPosition.y - intersection.size.height);
                } else if (tileIndx == 2) {
                    //tile is left of Koala
                    p.desiredPosition = ccp(p.desiredPosition.x + intersection.size.width, p.desiredPosition.y);
                } else if (tileIndx == 3) {
                    //tile is right of Koala
                    p.desiredPosition = ccp(p.desiredPosition.x - intersection.size.width, p.desiredPosition.y);
                } else {
                    if (intersection.size.width > intersection.size.height) { 
                        //tile is diagonal, but resolving collision vertically
                        float intersectionHeight;
                        if (tileIndx > 5) {
                            intersectionHeight = intersection.size.height;
                        } else {
                            intersectionHeight = -intersection.size.height;
                        }
                        p.desiredPosition = ccp(p.desiredPosition.x, p.desiredPosition.y + intersection.size.height );
                    } else {
                        //tile is diagonal, but resolving horizontally
                        float resolutionWidth;
                        if (tileIndx == 6 || tileIndx == 4) {
                            resolutionWidth = intersection.size.width;
                        } else {
                            resolutionWidth = -intersection.size.width;
                        }
                        p.desiredPosition = ccp(p.desiredPosition.x , p.desiredPosition.y + resolutionWidth);
                    } 
                } 
            }
        } 
    }
    p.position = p.desiredPosition;
}

@end
