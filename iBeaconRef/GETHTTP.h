//
//  GETHTTP.h
//  iBeaconRef
//
//  Created by oohashi on 2015/03/15.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GETHTTP : NSObject

@property (nonatomic)NSURL               *url;
@property (nonatomic)NSData              *query;
@property (nonatomic)NSMutableURLRequest *request;
@property (nonatomic)NSData              *contents;
@property (nonatomic)NSString            *contentsString;
@property (nonatomic)NSDictionary        *headers;

- (id)init;
- (id)initWithUrl: (NSURL *)url;
- (void)action;

@end
