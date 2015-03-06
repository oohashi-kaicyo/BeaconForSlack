//
//  MOiOSDevice.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/04.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "MOiOSDevice.h"

@implementation MOiOSDevice

- (id)init
{
    if(self = [super init]){
    }
    
    return [self initWithOwnerOfDevice:@"false"];
}

- (id)initWithOwnerOfDevice: (NSString *)ownerOfDevice
{
    self.ownerOfDevice = ownerOfDevice;
    
    return self;
}


@end
