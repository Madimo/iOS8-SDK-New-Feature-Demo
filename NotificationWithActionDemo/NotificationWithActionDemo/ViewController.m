//
//  ViewController.m
//  NotificationWithActionDemo
//
//  Created by Madimo on 14-6-8.
//  Copyright (c) 2014年 Madimo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
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

- (IBAction)sendNotificationWithMinimalAction:(id)sender
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    notification.alertBody = @"Minimal Notification Test";
    notification.category = @"MINIMAL_CATEGORY_IDENTIFIER";
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    notification.timeZone = [NSTimeZone localTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    self.label.hidden = NO;
}

@end
