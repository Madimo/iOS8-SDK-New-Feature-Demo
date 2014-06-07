//
//  DemoViewController.m
//  UIBlurEffectDemo
//
//  Created by Madimo on 14-6-7.
//  Copyright (c) 2014年 Madimo. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIVisualEffectView *effectView;
@end

@implementation DemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageView.image = [UIImage imageNamed:@"image"];
    [self.view addSubview:self.imageView];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    self.effectView.frame = CGRectInset(self.view.bounds, 50, 50);
    [self.view addSubview:self.effectView];
}

@end
