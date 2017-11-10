//
//  UserInfoDataSource.m
//  RongCloudDemo
//
//  Created by Cheng on 2017/11/10.
//  Copyright © 2017年 com.silknets. All rights reserved.
//

#import "UserInfoDataSource.h"

@interface UserInfoDataSource ()

@property (nonatomic,strong) RCUserInfo *Cheng;
@property (nonatomic,strong) RCUserInfo *Zhou;

@end

@implementation UserInfoDataSource

- (RCUserInfo *)Cheng{
    if (!_Cheng){
        _Cheng = [[RCUserInfo alloc] initWithUserId:@"Cheng" name:@"Cheng" portrait:@"http://tc.sinaimg.cn/maxwidth.800/tc.service.weibo.com/static_jinrongbaguanv_com/5886a925e3bd5fc2a3adf8f9a36324c8.png"];
    }
    return _Cheng;
}

- (RCUserInfo *)Zhou{
    if (!_Zhou){
        _Zhou = [[RCUserInfo alloc] initWithUserId:@"Cheng" name:@"Zhou" portrait:@"http://img4.dwstatic.com/5253wzry/1612/346505427587/1482550491657.jpg"];
    }
    return _Zhou;
}

- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion{
    if ([userId isEqualToString:@"Cheng"]){
        completion(self.Cheng);
    }else{
        completion(self.Zhou);
    }
}



@end
