//
//  ConversationListViewController.m
//  RongCloudDemo
//
//  Created by Cheng on 2017/11/10.
//  Copyright © 2017年 com.silknets. All rights reserved.
//

#import "ConversationListViewController.h"
#import "ConversationViewController.h"

@interface ConversationListViewController ()

@end

@implementation ConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",self.userID);
    
    self.displayConversationTypeArray = @[@(ConversationType_PRIVATE)];
    
    self.conversationListTableView.tableFooterView = [UIView new];
    self.showConnectingStatusOnNavigatorBar = true;
    self.isShowNetworkIndicatorView = true;
    
//    self.navigationController.viewControllers = @[self];
}

- (void)willDisplayConversationTableCell:(RCConversationBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"ConversationViewController" sender:model.targetId];
}
- (IBAction)close:(id)sender {
    [[RCIM sharedRCIM] logout];
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)add:(id)sender {
    NSString *targetID;

    if ([[[RCIMClient sharedRCIMClient] currentUserInfo].userId isEqualToString:@"Cheng"]){
        targetID = @"Zhou";
        [self performSegueWithIdentifier:@"ConversationViewController" sender:targetID];
    }else{
        targetID = @"Cheng";
        [self performSegueWithIdentifier:@"ConversationViewController" sender:targetID];
    }
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ConversationViewController *vc = [segue destinationViewController];
    vc.conversationType = ConversationType_PRIVATE;
    vc.targetId = sender;
    vc.title = sender;
}


@end
