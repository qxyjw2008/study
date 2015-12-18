//
//  ViewController.m
//  微信支付Demo
//
//  Created by 周琦 on 15/10/29.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"
#import "ZqNetWork.h"

@interface ViewController ()

@end

@implementation ViewController
/**
 *  微信支付需要后台做大量的工作。
 *  SDK及官方Demo下载：https://pay.weixin.qq.com/wiki/doc/api/app.php?chapter=11_1
 *  官方的开发步骤参考这里：https://pay.weixin.qq.com/wiki/doc/api/app.php?chapter=8_5
 *  这篇文档说的也挺详细：http://wenku.baidu.com/link?url=II3oeAaiH9NXWqdoO5HwXWCGcEermreHGBAqKvYfyKz_JVQ2n4NlA56e0H1HJWTNFfUsrTAgjegHBeUpMRzN0S318qcVklep7VCq0wBkpv7
 *  还有这篇：http://www.cocoachina.com/bbs/read.php?tid=303132
 */

// 移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
// 监听通知
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if([WXApi isWXAppInstalled]) // 判断 用户是否安装微信
    {
        // 监听一个通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getOrderPayResult:) name:@"ORDER_PAY_NOTIFICATION" object:nil];
    }
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"微信支付";
    UIButton *payButton = [UIButton buttonWithType:UIButtonTypeCustom];
    payButton.frame = CGRectMake(50, 100, self.view.frame.size.width - 100, 60);
    payButton.backgroundColor = [UIColor lightGrayColor];
    [payButton setTitle:@"微信支付" forState:UIControlStateNormal];
    [payButton setImage:[UIImage imageNamed:@"payNow_weixin"] forState:UIControlStateNormal];
    [payButton setImageEdgeInsets:UIEdgeInsetsMake(5, -20, 0, 0)];
    payButton.layer.cornerRadius = 5;
    [payButton addTarget:self action:@selector(weChatPay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payButton];
    
    
}


#pragma mark - 微信支付
- (void)weChatPay
{
#warning 1.向自己的服务器请求订单生成预支付订单信息
    NSString *string = [NSString stringWithFormat:@""];
    [ZqNetWork getRequestWithURLString:string Parameters:nil RequestHead:nil DataReturnType:DataReturnTypeData SuccessBlock:^(NSData *data) {
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        // 具体参数根据自己后台来,这里不做示范
        // 后台可以参考：https://pay.weixin.qq.com/wiki/doc/api/app.php?chapter=9_12
        NSDictionary *dict = [resultDic objectForKey:@""];
        if (dict != nil) {
            NSMutableString *stamp  = [dict objectForKey:@""];
            
            // 生成预支付订单信息
            PayReq *req             = [[PayReq alloc] init];
            req.openID              = [dict objectForKey:@""];
            req.partnerId           = @"";
            req.prepayId            = [dict objectForKey:@""];
            req.nonceStr            = [dict objectForKey:@""];
            req.timeStamp           = stamp.intValue;
            req.package             = [dict objectForKey:@""];
            req.sign                = [dict objectForKey:@""];
#warning 2.调起微信支付
            if ([WXApi sendReq:req])
            {
                NSLog(@"调起成功!!!!");
            }
            else
            {
                NSLog(@"调起失败!!!");
            }
        }
    } FailureBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}
#pragma mark - 收到支付成功的消息后作相应的处理
- (void)getOrderPayResult:(NSNotification *)notification
{
    if ([notification.object isEqualToString:@"success"])
    {
        NSLog(@"支付成功！");
    }
    else
    {
        NSLog(@"支付失败！");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
