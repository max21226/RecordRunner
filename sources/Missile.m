//
//  Missile.m
//  RecordRunnerARC
//
//  Created by Matt Cleveland on 1/18/13.
//
//

#import "GameLayer.h"
#import "Missile.h"

@implementation Missile


// -----------------------------------------------------------------------------------
- (id) init
{
    if( (self=[super init]) )
    {
        
    }
    return (self);
}

// -----------------------------------------------------------------------------------
- (void) showNextFrame
{
    // this is a negative movement down the Y-axis, the Bomb is rising
    // from the bottom of the screen    
    [self moveTo:COMMON_GET_NEW_RADIAL_POINT(COMMON_SCREEN_CENTER)];
    self.angleRotated++;
    
    if ([self encounterWithPlayer]) {
        [self handleCollision];
    } else {
        CGSize windowSize = [[CCDirector sharedDirector] winSize];
        CGPoint curPoint = [self.gameObjectSprite position];
        
        if (curPoint.y > windowSize.height) {
            [self removeFromGamePool:self.parentGameLayer.bombUsedPool];
        }
    }
}

// -----------------------------------------------------------------------------------
- (void) handleCollision
{
    [self removeFromGamePool:self.parentGameLayer.bombUsedPool];
    
    [self.parentGameLayer gameOver];
    
    [self.parentGameLayer.score decrementScore:1000];
}

// -----------------------------------------------------------------------------------
- (void) resetObject
{
    [super resetObject];
}

@end