//
//  MOiOSDevice.h
//  iBeaconRef
//
//  Created by oohashi on 2015/03/04.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOiOSDevice : NSObject

@property(nonatomic) NSString *ownerOfDevice;//監視 observerが登録
//@property(nonatomic) NSString *deviceToken;

- (id)initWithOwnerOfDevice: (NSString *)ownerOfDevice;

@end
