//
//  MOiPhonePosition.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/04.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "MOiPhonePosition.h"

@implementation MOiPhonePosition

+ (MOiPhonePosition *)SharedManerger
{
    static MOiPhonePosition *Singleton;
    static dispatch_once_t once;
    
    dispatch_once( &once, ^{
        Singleton = [[MOiPhonePosition alloc] init];
    });
    
    return Singleton;
}


- (id)init
{
    if(self = [super init]){
        self.latestRegion = [MOBeacon new];
        self.iOSDevice    = [MOiOSDevice new];
    }
    
    return self;
}

@end
