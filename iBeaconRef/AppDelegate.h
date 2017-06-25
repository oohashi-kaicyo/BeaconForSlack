//
//  AppDelegate.h
//  iBeaconRef
//
//  Created by oohashi on 2015/03/02.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//  必ずremoveObserverしましょう
//

#import <UIKit/UIKit.h>
#import "OBLocationManager.h"
//#import "MOLocationManager.h"
#import "OBPerpetuation.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow  *window;
@property (nonatomic) OBLocationManager *LocationManagerDelegater;
@property (nonatomic) CLBeaconRegion    *beaconRegion;
@property (nonatomic) OBPerpetuation    *Perpetuation;

- (id)init;
- (void)initForMonitoring;

@end

