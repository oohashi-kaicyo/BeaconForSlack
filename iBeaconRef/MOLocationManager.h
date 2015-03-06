//
//  MOLocationManager.h
//  iBeaconRef
//
//  Created by oohashi on 2015/03/03.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol MOLocationManagerDelegate <CLLocationManagerDelegate>

@end

@interface MOLocationManager : CLLocationManager

@property (nonatomic, assign) id<MOLocationManagerDelegate> delegate;
+ (MOLocationManager *)SharedManerger;
- (id)init;

@end
