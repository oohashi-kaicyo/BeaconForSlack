//
//  OBPoster.h
//  iBeaconRef
//
//  Created by oohashi on 2015/03/06.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOiPhonePosition.h"

@interface OBPoster : NSObject

@property (nonatomic)NSData              *query;
@property (nonatomic)NSMutableURLRequest *request;
@property (nonatomic)NSData              *contents;
@property (nonatomic)NSString            *contentsString;
@property (nonatomic)NSDictionary        *headers;

- (id)init;
- (id)postWithData: (id)data url: (NSURL *)url;
- (id)postWithKey: (NSString *)key content: (NSString *)content url: (NSString *)urlByString;

@end
