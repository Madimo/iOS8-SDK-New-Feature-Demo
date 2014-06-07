//
//  ViewController.m
//  TouchIDDemo
//
//  Created by Madimo on 14-6-7.
//  Copyright (c) 2014年 Madimo. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)authorize:(id)sender {
    
    LAContext *context = [[LAContext alloc] init];
    NSError *contextError = nil;
    NSString *localizedReasonString = @"Need Authorize";
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&contextError]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:localizedReasonString
                          reply:^(BOOL success, NSError *error) {
                              NSString *title, *message;
                              
                              if (success) {
                                  title = @"Authorize Success";
                                  message = nil;
                              } else {
                                  title = @"Authorize Faied";
                                  message = error.localizedFailureReason;
                              }
                              
                              UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                                                  message:message
                                                                                 delegate:nil
                                                                        cancelButtonTitle:@"OK"
                                                                        otherButtonTitles:nil];
                              [alertView show];
                          }];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Context Error"
                                                            message:contextError.localizedFailureReason
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
    
}

@end
