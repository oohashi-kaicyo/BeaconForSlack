//
//  OBRegister.h
//  iBeaconRef
//
//  Created by oohashi on 2015/03/06.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBRegister : NSObject

+ (BOOL)registObserveObject: (id)object key:(NSString *)key;

@end
