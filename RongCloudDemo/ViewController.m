//
//  ViewController.m
//  RongCloudDemo
//
//  Created by Cheng on 2017/11/10.
//  Copyright © 2017年 com.silknets. All rights reserved.
//

#import "ViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "ConversationListViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)click123:(id)sender {
    [self connectWithToken:@"kH3bSmLZFQKxcOfg1X/pZmEiumtcjMJVADC50XbwMWWEhBZj811/v/BAylg0GB4/81b/qevqu6O0rVrAlSeOMA==" sender:sender];
}

- (IBAction)click456:(id)sender {
    [self connectWithToken:@"ukfNcFsbtiBsiJuiN8c9Aft7Huo+QiXFPIW7bp/6YYkV+V78e8d6r3UteP+r/9JO7m6s539v3UEOZdQ3i0sF1w==" sender:sender];
}

- (void)connectWithToken:(NSString *)token sender:(id)sender{
    [[RCIMClient sharedRCIMClient] connectWithToken:token
                                            success:^(NSString *userId) {
                                                NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    [self performSegueWithIdentifier:@"ConversationListViewController" sender:userId];
                                                });
                                            } error:^(RCConnectErrorCode status) {
                                                NSLog(@"登陆的错误码为:%ld", (long)status);
                                            } tokenIncorrect:^{
                                                //token过期或者不正确。
                                                //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
                                                //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
                                                NSLog(@"token错误");
                                            }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ConversationListViewController *vc = [segue destinationViewController];
    vc.userID = sender;
    vc.title = sender;
}


@end
