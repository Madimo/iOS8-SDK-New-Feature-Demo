//
//  AppDelegate.m
//  NotificationWithActionDemo
//
//  Created by Madimo on 14-6-8.
//  Copyright (c) 2014年 Madimo. All rights reserved.
//

#import "AppDelegate.h"

#define REPLY_IDENTIFIER @"REPLY_IDENTIFIER"
#define TRASH_IDENTIFIER @"TRASH_IDENTIFIER"

@interface AppDelegate ()
            

@end

@implementation AppDelegate


- (void)registerUserNotification
{
    
    UIMutableUserNotificationAction *actionReply = [[UIMutableUserNotificationAction alloc] init];
    actionReply.title = @"Reply";
    actionReply.identifier = REPLY_IDENTIFIER;
    actionReply.activationMode = UIUserNotificationActivationModeForeground;
    actionReply.destructive = NO;
    actionReply.authenticationRequired = NO;
    
    UIMutableUserNotificationAction *actionTrash = [[UIMutableUserNotificationAction alloc] init];
    actionTrash.title = @"Trash";
    actionTrash.identifier = TRASH_IDENTIFIER;
    actionTrash.activationMode = UIUserNotificationActivationModeBackground;
    actionTrash.destructive = YES;
    actionTrash.authenticationRequired = YES;
    
    UIMutableUserNotificationCategory *minimalCategory = [[UIMutableUserNotificationCategory alloc] init];
    minimalCategory.identifier = @"MINIMAL_CATEGORY_IDENTIFIER";
    [minimalCategory setActions:@[actionTrash, actionReply] forContext:UIUserNotificationActionContextMinimal];
    
    NSSet *categories = [NSSet setWithObjects:minimalCategory, nil];
    
    UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                             categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler
{
    NSLog(@"Handle Action With Identifier: %@", identifier);
    
    completionHandler();
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"Did receive local notification: %@", notification.alertBody);
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    NSLog(@"Did register user notification settings");
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Register user notification settings fail: %@", error.localizedDescription);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self registerUserNotification];
    
    return YES;
}

@end
