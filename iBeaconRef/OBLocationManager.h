//
//  OBLocationManager.h
//  iBeaconRef
//
//  Created by oohashi on 2015/03/03.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//  このクラスは「Observer」の役割を果たします．
//  実装方法は「Delegate」です．

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>//?
#import "MOiPhonePosition.h"
#import "MOLocationManager.h"

@interface OBLocationManager : NSObject<MOLocationManagerDelegate>

@property (nonatomic) CLBeaconRegion   *beaconRegion;
//@property (nonatomic) MOiPhonePosition *iPhoneDevicePosition;

- (id)initWithBeaconRegion: (CLBeaconRegion *)beaconRegion;

@end
