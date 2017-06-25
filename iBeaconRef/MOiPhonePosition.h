//
//  MOiPhonePosition.h
//  iBeaconRef
//
//  Created by oohashi on 2015/03/04.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "MOiOSDevice.h"
#import "MOBeacon.h"

@interface MOiPhonePosition : NSObject

@property (nonatomic) MOiOSDevice *iOSDevice;
@property (nonatomic) MOBeacon    *latestRegion;

+ (MOiPhonePosition *)SharedManerger;
- (id)init;

@end
