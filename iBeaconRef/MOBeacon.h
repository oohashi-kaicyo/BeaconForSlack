//
//  MOBeacon.h
//  iBeaconRef
//
//  Created by oohashi on 2015/03/04.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOBeacon : NSObject

@property (nonatomic) NSNumber *major;
@property (nonatomic) NSNumber *minor;
@property (nonatomic) NSString *state;

- (id)initWithMajor: (NSNumber *)major minor:(NSNumber *)minor;

@end
