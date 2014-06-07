//
//  ViewController.m
//  UIAlertControllerDemo
//
//  Created by Madimo on 14-6-7.
//  Copyright (c) 2014年 Madimo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController

- (IBAction)showAlert:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"This is Title"
                                                                   message:@"This is message"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Action 1 (Default Style)"
                                             style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction *action) {
                                               NSLog(@"Action 1 Handler Called");
                                           }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Action 2 (Cancel Style)"
                                              style:UIAlertActionStyleCancel
                                            handler:^(UIAlertAction *action) {
                                                NSLog(@"Action 2 Handler Called");
                                            }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Action 3 (Destructive Style)"
                                              style:UIAlertActionStyleDestructive
                                            handler:^(UIAlertAction *action) {
                                                NSLog(@"Action 3 Handler Called");
                                            }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)showAlertWithTextField:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"This is Title"
                                                                   message:@"This is message"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Login"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action) {
                                                NSLog(@"Login Handler Called");
                                                [alert dismissViewControllerAnimated:YES completion:nil];
                                                UITextField *usernameTextField = alert.textFields[0];
                                                UITextField *passwordTextField = alert.textFields[1];
                                                NSLog(@"Username:%@ Password:%@", usernameTextField.text, passwordTextField.text);
                                            }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                              style:UIAlertActionStyleCancel
                                            handler:^(UIAlertAction *action) {
                                                NSLog(@"Cancel Handler Called");
                                            }]];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Username";
        textField.returnKeyType = UIReturnKeyNext;
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Password";
        textField.secureTextEntry = YES;
        textField.returnKeyType = UIReturnKeyGo;
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)showActionSheet:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"This is Title"
                                                                   message:@"This is message"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"Action 1 (Default Style)"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action) {
                                                NSLog(@"Action 1 Handler Called");
                                            }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Action 2 (Cancel Style)"
                                              style:UIAlertActionStyleCancel
                                            handler:^(UIAlertAction *action) {
                                                NSLog(@"Action 2 Handler Called");
                                            }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Action 3 (Destructive Style)"
                                              style:UIAlertActionStyleDestructive
                                            handler:^(UIAlertAction *action) {
                                                NSLog(@"Action 3 Handler Called");
                                            }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
