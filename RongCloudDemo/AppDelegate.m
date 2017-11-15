//
//  AppDelegate.m
//  RongCloudDemo
//
//  Created by Cheng on 2017/11/10.
//  Copyright © 2017年 com.silknets. All rights reserved.
//

#import "AppDelegate.h"
#import <RongIMKit/RongIMKit.h>
#import "UserInfoDataSource.h"
#import <RongIMLib/RongIMLib.h>
#import "RCDLive.h"
#import "RCDLiveGiftMessage.h"

@interface AppDelegate ()
@property (nonatomic,strong) UserInfoDataSource *userInfo;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[RCIM sharedRCIM] initWithAppKey:RONGCLOUD_IM_APPKEY];
    _userInfo = [UserInfoDataSource new];
    [[RCIM sharedRCIM] setUserInfoDataSource:_userInfo];
    
    [[RCDLive sharedRCDLive] initRongCloud:RONGCLOUD_IM_APPKEY];
    //注册自定义消息
    [[RCDLive sharedRCDLive] registerRongCloudMessageType:[RCDLiveGiftMessage class]];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"RoleList" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    _userList = [[NSMutableArray alloc]init];
    RCUserInfo *user = [self parseUserInfoFormDic:[data objectForKey:@"User1"]];
    [_userList  addObject:user];
    RCUserInfo *user2 = [self parseUserInfoFormDic:[data objectForKey:@"User2"]];
    [_userList  addObject:user2];
    RCUserInfo *user3 = [self parseUserInfoFormDic:[data objectForKey:@"User3"]];
    [_userList  addObject:user3];
    RCUserInfo *user4 = [self parseUserInfoFormDic:[data objectForKey:@"User4"]];
    [_userList  addObject:user4];
    RCUserInfo *user5 = [self parseUserInfoFormDic:[data objectForKey:@"User5"]];
    [_userList  addObject:user5];
    RCUserInfo *user6 = [self parseUserInfoFormDic:[data objectForKey:@"User6"]];
    [_userList  addObject:user6];
    RCUserInfo *user7 = [self parseUserInfoFormDic:[data objectForKey:@"User7"]];
    [_userList  addObject:user7];
    
    return YES;
}

-(RCUserInfo *)parseUserInfoFormDic:(NSDictionary *)dic{
    RCUserInfo *user = [[RCUserInfo alloc]init];
    user.userId = [dic objectForKey: @"id" ];
    user.name = [dic objectForKey: @"name" ];
    user.portraitUri = [dic objectForKey: @"icon" ];
    return user;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
