//
//  OBAlertDelegate.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/15.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "OBAlertDelegate.h"

@implementation OBAlertDelegate

-(void)alertView: (UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Tapped: %ld", (long)buttonIndex);
}

@end
