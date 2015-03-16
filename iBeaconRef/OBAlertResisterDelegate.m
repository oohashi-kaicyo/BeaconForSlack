//
//  OBAlertResisterDelegate.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/15.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "OBAlertResisterDelegate.h"

@interface OBAlertResisterDelegate ()

@end

@implementation OBAlertResisterDelegate

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)alertView: (UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [MOiPhonePosition SharedManerger].iOSDevice.ownerOfDevice = [WorkSpace SharedManerger].textUserName;
    }
}

@end
