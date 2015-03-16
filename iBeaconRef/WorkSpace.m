
//
//  WorkSpace.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/15.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "WorkSpace.h"

@implementation WorkSpace

- (id)init
{
    return self;
}

+ (WorkSpace *)SharedManerger
{
    static WorkSpace *Singleton;
    static dispatch_once_t once;
    
    dispatch_once( &once, ^{
        Singleton = [[WorkSpace alloc] init];
    });
    
    return Singleton;
}

@end
