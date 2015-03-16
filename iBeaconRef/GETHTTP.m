//
//  GETHTTP.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/15.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "GETHTTP.h"

@implementation GETHTTP

- (id)init
{
    return [self initWithUrl:[NSURL URLWithString:@"http://kaicyo.local/Beacon/API/insert.php?user_name=kaicyo&state=INSIDE"]];
}

- (id)initWithUrl: (NSURL *)url
{
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}

- (void)action
{
    self.request = [NSMutableURLRequest requestWithURL:self.url
                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                       timeoutInterval:60.0];
    [self.request setHTTPMethod:@"GET"];
    [self.request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSHTTPURLResponse   *httpResponse;
    self.contents = [NSURLConnection sendSynchronousRequest:self.request returningResponse:&httpResponse error:nil];
    self.contentsString = [[NSString alloc] initWithData:self.contents encoding:NSUTF8StringEncoding];
    NSLog(@"%@", self.contentsString);
}

@end
