//
//  ViewController.m
//  CreateButton
//
//  Created by Benjamin on 12/26/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] init];
    
    btn.frame = CGRectMake(0, 0, 100, 100);
    
    UIImage *normal = [UIImage imageNamed:@"宝宝"];
    [btn setBackgroundImage:normal forState:UIControlStateNormal];
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"小布丁"] forState:UIControlStateHighlighted];
    [btn setTitle:@"摸我干啥" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    field.backgroundColor = [UIColor redColor];
    field.center = self.view.center;
    
    [self.view addSubview:field];
}

- (void)btnClick
{
    NSLog(@"点击我-----------------");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
