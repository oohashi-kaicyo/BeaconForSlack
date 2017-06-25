//
//  OBPerpetuation.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/06.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "OBPerpetuation.h"
#import "MOiPhonePosition.h"

@implementation OBPerpetuation

- (id)init
{
    if (self = [super init]) {
        self.positionStatePoster = [OBPoster new];
        [[MOiPhonePosition SharedManerger].iOSDevice addObserver:self
                                                      forKeyPath:@"ownerOfDevice"
                                                         options:NSKeyValueObservingOptionNew
                                                         context:nil];
        [[MOiPhonePosition SharedManerger].latestRegion addObserver:self
                                                         forKeyPath:@"state"
                                                            options:NSKeyValueObservingOptionNew
                                                            context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (![OBRegister registObserveObject:[change objectForKey:@"new"] key:keyPath] ) {
        NSLog(@"OBSERVER_REGIST_ERROR: ");
    } else {
        NSLog(@"OBSERVER_REGIST_REZ: %@", [[NSUserDefaults standardUserDefaults] objectForKey:keyPath]);
    }
    if ([keyPath isEqual:@"state"]) {
        NSString *text = @"";
        NSString *slackApiKey = @"****-****-****-****-****";
        if ([[change objectForKey:@"new"] isEqual:@"ENTER"]) {
            text = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ownerOfDevice"] stringByAppendingString:@"が研究室に入室しました"];
        }
        if ([[change objectForKey:@"new"] isEqual:@"EXIT"]) {
            text = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ownerOfDevice"] stringByAppendingString:@"が研究室から退室しました"];
        }
        text = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                         NULL,
                                                                                         (CFStringRef)text,
                                                                                         NULL,
                                                                                         (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                         kCFStringEncodingUTF8 ));
        NSURL *url;
        url =[NSURL URLWithString:[NSString stringWithFormat:@"https://slack.com/api/chat.postMessage?token=%@&channel=C040JP5E5&text=%@&as_user=true", slackApiKey, text]];
        GETHTTP *getHttp = [[GETHTTP alloc] initWithUrl:url];
        [getHttp action];
        id response;
        if (![response isKindOfClass:[NSError class]]) {
            NSLog(@"XXX: %@",response);
        }
    }
}
@end
