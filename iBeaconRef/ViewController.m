//
//  ViewController.m
//  iBeaconRef
//
//  Created by oohashi on 2015/03/02.
//  Copyright (c) 2015年 Yasuhiro.Hashimoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad
{
        self.alertResisterDelegate = [OBAlertResisterDelegate new];
        self.alertUserNameResister = [[UIAlertView alloc]
                                      initWithTitle:@"確認"
                                      message:([NSString stringWithFormat:@"ユーザー名を%@として登録しますか?", self.textUserName.text])
                                      delegate:self.alertResisterDelegate
                                      cancelButtonTitle:@"Cancel"
                                      otherButtonTitles:@"OK", nil
                                      ];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)resisterUserName:(UIButton *)sender
{
    [WorkSpace SharedManerger].textUserName = self.textUserName.text;
    self.alertUserNameResister.message =([NSString stringWithFormat:@"ユーザー名を「%@」として登録しますか?", self.textUserName.text]);
    [self.alertUserNameResister show];
}

@end
