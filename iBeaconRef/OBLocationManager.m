//
//  OBLocationManager.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/03.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "OBLocationManager.h"

@implementation OBLocationManager

- (id)init
{
    if(self = [super init]) {
    }
    return [self initWithBeaconRegion:[
                                       [CLBeaconRegion alloc]
                                       initWithProximityUUID:[[NSUUID alloc]
                                       initWithUUIDString:@"****-****-****-****-***********" ]
                                       identifier:@"********"
                                       ]];
}

- (id)initWithBeaconRegion:(CLBeaconRegion *)beaconRegion
{
    self.beaconRegion = beaconRegion;
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    if ([region isMemberOfClass:[CLBeaconRegion class]] && [MOLocationManager isRangingAvailable]) {
        [[MOLocationManager SharedManerger]  startRangingBeaconsInRegion:(CLBeaconRegion *)region];
        [MOiPhonePosition SharedManerger].latestRegion.state = @"ENTER";
    }
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    if ([region isMemberOfClass:[CLBeaconRegion class]] && [CLLocationManager isRangingAvailable]) {
        [[MOLocationManager SharedManerger]  stopRangingBeaconsInRegion:(CLBeaconRegion *)region];
        [MOiPhonePosition SharedManerger].latestRegion.state = @"EXIT";
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusNotDetermined) {
        NSLog(@"startMonitoringForRegion1");
    } else if(status == kCLAuthorizationStatusAuthorizedAlways) {
        [[MOLocationManager SharedManerger]  startMonitoringForRegion:  self.beaconRegion];
        NSLog(@"startMonitoringForRegion2");
    } else if(status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"startMonitoringForRegion3");
        [[MOLocationManager SharedManerger]  startMonitoringForRegion:  self.beaconRegion];
    }
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    NSLog(@"didStartMonitoringForRegion");
    [[MOLocationManager SharedManerger] requestStateForRegion:region];
}

-(void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region
{
    switch (state) {
        case CLRegionStateInside:
        {
            if ([[MOiPhonePosition SharedManerger].latestRegion.state isEqual:@"EXIT"] ||
                [[MOiPhonePosition SharedManerger].latestRegion.state isEqual:@""]     ||
               ![MOiPhonePosition SharedManerger].latestRegion.state) {
                [MOiPhonePosition SharedManerger].latestRegion.state = @"ENTER";
                if([region isMemberOfClass:[CLBeaconRegion class]] && [MOLocationManager isRangingAvailable]) {
                    [[MOLocationManager SharedManerger]  startRangingBeaconsInRegion:(CLBeaconRegion *)region];
                }
            }
        }
        break;
        case CLRegionStateOutside:
        break;
        case CLRegionStateUnknown:
        break;
        default:
        break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    if (beacons.count > 0) {
        CLBeacon *firstBeacon = beacons.firstObject;
        if (beacons.count > 0) {
            [MOiPhonePosition SharedManerger].latestRegion.major = firstBeacon.major;
            [MOiPhonePosition SharedManerger].latestRegion.minor = firstBeacon.minor;
            [[MOLocationManager SharedManerger] stopRangingBeaconsInRegion:self.beaconRegion];
        }
    }
}
@end
