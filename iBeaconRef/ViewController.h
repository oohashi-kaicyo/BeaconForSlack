//
//  ViewController.h
//  iBeaconRef
//
//  Created by oohashi on 2015/03/02.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBAlertResisterDelegate.h"
#import "WorkSpace.h"

@interface ViewController : UIViewController

@property (nonatomic) OBAlertResisterDelegate *alertResisterDelegate;
@property (weak, nonatomic) IBOutlet UITextField *textUserName;
@property (nonatomic) UIAlertView *alertUserNameResister;

- (id)init;

@end