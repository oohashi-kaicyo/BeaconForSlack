//
//  OBPoster.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/06.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "OBPoster.h"

@implementation OBPoster

- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

- (id)postWithData:(id)data url:(NSURL *)url
{
    self.query = [data dataUsingEncoding: NSUTF8StringEncoding];
    self.request = [NSMutableURLRequest requestWithURL:url
                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                       timeoutInterval:60.0];
    [self.request setHTTPMethod:@"POST"];
    [self.request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [self.request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[self.query length]] forHTTPHeaderField:@"Content-Length"];
    [self.request setHTTPBody:self.query];
    
    NSHTTPURLResponse *httpResponse;
    NSError *error = nil;
    self.contents = [NSURLConnection sendSynchronousRequest:self.request returningResponse:&httpResponse error:&error];
    self.contentsString = [[NSString alloc] initWithData:self.contents encoding:NSUTF8StringEncoding];
    if(error) {
        return error;
    }
    return self.contentsString;
}

- (id)postWithKey:(NSString *)key content:(NSString *)content url:(NSString *)urlByString
{
    return [self postWithData:[NSString stringWithFormat:@"user_name=%@&state=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"ownerOfDevice"] ,content] url:[NSURL URLWithString:urlByString]];
}

@end
