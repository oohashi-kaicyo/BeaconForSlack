//
//  AppDelegate.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/02.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//  iBeacon機能(MonitoeringやRanging)の実装
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (id)init
{
    if(self = [super init]) {
        self.Perpetuation = [OBPerpetuation new];
        self.beaconRegion = [
           [CLBeaconRegion alloc] initWithProximityUUID:[[NSUUID alloc]
                                     initWithUUIDString:@"00000000-48A4-1001-B000-001C4D175E4E" ]
                                             identifier:@"yasuhiro.hashimoto"
        ];
        self.LocationManagerDelegater = [[OBLocationManager alloc] initWithBeaconRegion:self.beaconRegion];
        [MOLocationManager SharedManerger].delegate = self.LocationManagerDelegater;
        if ([MOLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
            [self initForMonitoring];
        }
    }
    return self;
}

- (void)initForMonitoring
{
    if ([[MOLocationManager SharedManerger] respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [[MOLocationManager SharedManerger] requestAlwaysAuthorization];
    } else {
        [[MOLocationManager SharedManerger] startMonitoringForRegion:self.beaconRegion];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
