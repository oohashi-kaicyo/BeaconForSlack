//
//  OBPoster.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/06.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "OBPoster.h"

@implementation OBPoster

- (id)postWithData:(id)data url:(NSURL *)url
{
    self.query = [data dataUsingEncoding: NSUTF8StringEncoding];
    self.request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost/test/"]//url
                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                       timeoutInterval:60.0];
    [self.request setHTTPMethod:@"POST"];
    [self.request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [self.request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[self.query length]] forHTTPHeaderField:@"Content-Length"];
    [self.request setHTTPBody:self.query];
    
    /* HTTP リクエスト送信 */
    NSHTTPURLResponse   *httpResponse;
    self.contents = [NSURLConnection sendSynchronousRequest:self.request
                                             returningResponse:&httpResponse error:nil];
    NSString *contentsString = [[NSString alloc] initWithData:self.contents encoding:NSUTF8StringEncoding];
    NSLog(@"contents:\n%@", contentsString);
    
    /* HTTP レスポンスヘッダ取得 */
    NSDictionary *headers = httpResponse.allHeaderFields;
    for (id key in headers) {
        NSLog(@"%@: %@", key, [headers objectForKey:key]);
    }
    
    return self.headers;
}

- (id)postWithData:(NSString *)key content:(NSString *)content url:(NSString *)urlByString
{
    
    return [self postWithData:[NSString stringWithFormat:@"%@=%@", key,content] url:[NSURL URLWithString:urlByString]];
}

@end
