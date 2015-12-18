//
//  ViewController.m
//  银联支付Demo
//
//  Created by 周琦 on 15/10/30.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "ViewController.h"
#import "ZqNetWork.h"
#import "UPPayPluginDelegate.h"
#import "UPPayPlugin.h"

@interface ViewController ()<UPPayPluginDelegate>

@end

@implementation ViewController

/**
 *  银联支付SDK：https://open.unionpay.com/ajweb/help/file
 *  需要调设的地方可以参考这里：http://www.jianshu.com/p/92d615f78509
 *  http://www.jianshu.com/p/92d615f78509
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"银联支付";
    UIButton *payButton = [UIButton buttonWithType:UIButtonTypeCustom];
    payButton.frame = CGRectMake(50, 100, self.view.frame.size.width - 100, 60);
    payButton.backgroundColor = [UIColor lightGrayColor];
    [payButton setTitle:@"银联支付" forState:UIControlStateNormal];
    [payButton setImage:[UIImage imageNamed:@"payNow_bank"] forState:UIControlStateNormal];
    payButton.layer.cornerRadius = 5;
    [payButton setImageEdgeInsets:UIEdgeInsetsMake(5, -20, 0, 0)];
    [payButton addTarget:self action:@selector(upPay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payButton];
}

- (void)upPay
{
    // 向自己的服务器请求生成订单
    NSString *unPayStr = [NSString stringWithFormat:@"", @""];
    unPayStr = [unPayStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [ZqNetWork getRequestWithURLString:unPayStr Parameters:nil RequestHead:nil DataReturnType:DataReturnTypeData SuccessBlock:^(NSData *data) {
        NSDictionary *myDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        // 银联返回的流水号
        // 具体返回参数结果依据自己的后台
        NSString *tn = [NSString stringWithFormat:@"%@", [[myDic objectForKey:@""] objectForKey:@""]];
        if (tn != nil && tn.length > 0)
        {
            // 调用银联的SDK
            // 参数1: 00 发布环境  01 测试环境
            // 参数2: 调用支付的VC
            // 参数3: 代理人
            [UPPayPlugin startPay:tn mode:@"00" viewController:self delegate:self];
        }
    } FailureBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - 银联支付返回结果
-(void)UPPayPluginResult:(NSString*)result
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"支付结果" message:result preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
