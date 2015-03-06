//
//  MOLocationManager.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/03.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "MOLocationManager.h"

@implementation MOLocationManager

//@synthesize delegate;

+ (MOLocationManager *)SharedManerger
{
    static MOLocationManager *Singleton;
    static dispatch_once_t once;
    
    dispatch_once( &once, ^{
        Singleton = [[MOLocationManager alloc] init];
    });
    
    return Singleton;
}

- (id)init
{
    if(self = [super init]){
    }
    
    return self;
}

@end
