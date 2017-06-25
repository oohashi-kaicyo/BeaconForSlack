//
//  MOBeacon.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/04.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "MOBeacon.h"

@implementation MOBeacon

- (id)init
{
    if(self = [super init]){
    }
    
    return [self initWithMajor:@1 minor:@1];
}

- (id)initWithMajor:(NSNumber *)major minor:(NSNumber *)minor
{
    self.major = major;
    self.minor = minor;
    
    return self;
}
@end
