//
//  OBPerpetuation.h
//  iBeaconRef
//
//  Created by oohashi on 2015/03/06.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBRegister.h"
#import "OBPoster.h"
#import "GETHTTP.h"

@interface OBPerpetuation : NSObject
@property (nonatomic) OBPoster *positionStatePoster;
- (id)init;
@end
