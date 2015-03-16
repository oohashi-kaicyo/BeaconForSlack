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
        NSLog(@"change");
        NSString *text = @"";
        NSString *slackApiKey = @"xoxp-3597322341-3611854702-4018910917-9498b8";
        if ([[change objectForKey:@"new"] isEqual:@"ENTER"]) {
            text = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ownerOfDevice"] stringByAppendingString:@"が研究室に入室しました"];
        }
        if ([[change objectForKey:@"new"] isEqual:@"EXIT"]) {
            text = [[[NSUserDefaults standardUserDefaults] objectForKey:@"ownerOfDevice"] stringByAppendingString:@"が研究室から退室しました"];
        }
        NSLog(@"URLB: %@",[NSString stringWithFormat:@"https://slack.com/api/chat.postMessage?token=%@&channel=C040JP5E5&text=%@&as_user=true", slackApiKey, text]);////
        text = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                         NULL,
                                                                                         (CFStringRef)text,
                                                                                         NULL,
                                                                                         (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                         kCFStringEncodingUTF8 ));
        
        NSURL *url;
        url =[NSURL URLWithString:[NSString stringWithFormat:@"https://slack.com/api/chat.postMessage?token=%@&channel=C040JP5E5&text=%@&as_user=true", slackApiKey, text]];
        //
        GETHTTP *getHttp = [[GETHTTP alloc] initWithUrl:url];
        NSLog(@"URL: %@", url);//?////////////////////////////////////
        [getHttp action];////////////////////////////////////////////////////////////
        id response;
        //response = [self.positionStatePoster postWithKey:keyPath
//                                      content:[change objectForKey:@"new"]
  //                                        url:@"http://kaicyo.local/Beacon/API/insert.php"];
        //http://133.2.181.131/Beacon/API/insert.php
        if ([response isKindOfClass:[NSError class]]) {
            NSLog(@"CCC: %@",response);
            //ここに再送処理を実装
            //
        } else {
            NSLog(@"XXX: %@",response);
        }
    }
}

@end