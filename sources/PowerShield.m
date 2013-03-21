//
//  PowerShield.m
//  RecordRunnerARC
//
//  Created by Matt Cleveland on 2/2/13.
//
//

#import "PowerShield.h"
#import "GameInfoGlobal.h"

@implementation PowerShield

@synthesize startTime = _startTime;

// -----------------------------------------------------------------------------------
- (void) addPower
{
    _startTime = [NSDate date];
    [[GameLayer sharedGameLayer].player setSheilded:YES];
    
    [super addPower];
    
    [[[GameInfoGlobal sharedGameInfoGlobal].statsContainer at:SHIELD_STATS] tick];
}

// -----------------------------------------------------------------------------------
- (void) runPower
{
    NSTimeInterval elapsed = abs([_startTime timeIntervalSinceNow]);
    if (elapsed > SHIELD_LIFETIME_SEC) {
        NSLog(@"Shield has expired");
        [[GameLayer sharedGameLayer].player setSheilded:NO];
        [super resetPower];
    }
}

@end
