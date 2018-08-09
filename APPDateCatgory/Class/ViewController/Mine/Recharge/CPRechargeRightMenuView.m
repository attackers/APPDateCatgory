//
//  CPRechargeRightMenuView.m
//  lottery
//
//  Created by way on 2017/11/27.
//  Copyright © 2017年 way. All rights reserved.
//

#import "CPRechargeRightMenuView.h"
#import "CPRechargeRecordVC.h"

@interface CPRechargeRightMenuView()

@property(nonatomic,assign)UINavigationController *actionNav;

@end

@implementation CPRechargeRightMenuView

+(CPRechargeRightMenuView *)showRightMenuViewOnView:(UIView *)supview
                                            originY:(CGFloat)originY
                         actionNavigationController:(UINavigationController *)nav;
{
    CPRechargeRightMenuView *view = [CPRechargeRightMenuView createViewFromNib];
    view.actionNav = nav;
    view.frame = CGRectMake(0, originY, supview.width, supview.height-originY);
    [view showOnView:supview];
    return view;
}

-(void)showOnView:(UIView *)supview
{
    self.layer.opacity = 0;
    [supview addSubview:self];
    [UIView animateWithDuration:0.38 animations:^{
        self.layer.opacity = 1;
    }];
}

-(void)dismiss
{
    [UIView animateWithDuration:0.38 animations:^{
        self.layer.opacity = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (IBAction)buttonActions:(UIButton *)sender {
    
    switch (sender.tag) {
        case 101:
        {
            //充值记录
            CPRechargeRecordVC *vc = [CPRechargeRecordVC new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.actionNav pushViewController:vc animated:YES];
            
        }break;
        case 102:
        {
            //在线客服
            if ([CPGlobalDataManager shareGlobalData].kefuUrlString) {
                [self loadKefuWebView];
            }else{
                [self queryKefuUrlString];
            }
            
        }break;
            
        default:
            break;
    }
    [self dismiss];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self dismiss];
}

-(void)queryKefuUrlString
{
    [SVProgressHUD way_showLoadingCanNotTouchBlackBackground];
    
    NSMutableDictionary *paramsDic =[[NSMutableDictionary alloc]initWithDictionary:@{@"token":[SUMUser shareUser].token}];
    [paramsDic setObject:@"2" forKey:@"deviceType"];
    NSString *paramsString = [NSString encryptedByGBKAES:[paramsDic JSONString]];
    
    [SUMRequest startWithDomainString:[CPGlobalDataManager shareGlobalData].domainUrlString
                              apiName:CPSerVerAPINameForAPIKefu
                               params:@{@"data":paramsString}
                         rquestMethod:YTKRequestMethodGET
           completionBlockWithSuccess:^(__kindof SUMRequest *request) {
               
               NSString *alertMsg = @"";
               if (request.resultIsOk) {
                   
                   NSString *urlString = [request.resultInfo DWStringForKey:@"data"];
                   [CPGlobalDataManager shareGlobalData].kefuUrlString = urlString;
                   [self loadKefuWebView];
                   
               }else{
                   alertMsg = request.requestDescription;
               }
               [SVProgressHUD way_dismissThenShowInfoWithStatus:alertMsg];
               
               
           } failure:^(__kindof SUMRequest *request) {
               
               [SVProgressHUD way_dismissThenShowInfoWithStatus:@"网络异常"];
           }];
    
}


-(void)loadKefuWebView
{
    CPWebViewController *toWebVC = [[CPWebViewController alloc]cpWebWithURLString:[[NSString alloc]initWithString:[CPGlobalDataManager shareGlobalData].kefuUrlString]];
    toWebVC.title = @"客服";
    toWebVC.showPageTitles = NO;
    toWebVC.showActionButton = NO;
    toWebVC.navigationButtonsHidden = YES;
    toWebVC.hidesBottomBarWhenPushed = YES;
    [self.actionNav pushViewController:toWebVC animated:YES];
}

@end
