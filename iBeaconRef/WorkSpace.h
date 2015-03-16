//
//  WorkSpace.h
//  iBeaconRef
//
//  Created by oohashi on 2015/03/15.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkSpace : NSObject

@property (nonatomic) NSString *textUserName;

- (id)init;
+ (WorkSpace *)SharedManerger;

@end
