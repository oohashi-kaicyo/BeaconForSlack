//
//  OBPerpetuation.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/06.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "OBPerpetuation.h"
#import "MOiPhonePosition.h"

@implementation OBPerpetuation//ラップして使うこと．

- (id)init
{
    //監視対象追加
        [[MOiPhonePosition SharedManerger].iOSDevice addObserver:self forKeyPath:@"ownerOfDevice" options:NSKeyValueObservingOptionNew context:nil];
    [[MOiPhonePosition SharedManerger].latestRegion addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:nil];
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //if ([keyPath isEqual:@"state"]) {ならPOST下 日付　例外(!){emer{res lop}}
        if (![OBRegister registObserveObject:[change objectForKey:@"new"] key:keyPath] ) {
            NSLog(@"OBSERVER_REGIST_ERROR: ");
        }
        else{
            NSLog(@"OBSERVER_REGIST_REZ: %@", [[NSUserDefaults standardUserDefaults] objectForKey:keyPath]);
        }
    //}
    //post string(key value) url 
}

@end
