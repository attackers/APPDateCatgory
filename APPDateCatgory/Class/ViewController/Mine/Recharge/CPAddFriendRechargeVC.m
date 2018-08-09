//
//  CPAddFriendRechargeVC.m
//  lottery
//
//  Created by way on 2017/11/27.
//  Copyright © 2017年 way. All rights reserved.
//

#import "CPAddFriendRechargeVC.h"

@interface CPAddFriendRechargeVC ()
{
    IBOutlet UILabel *_titleLabel;
    IBOutlet UILabel *_descLabel;
    IBOutlet UILabel *_detailLabel;
    IBOutlet UIImageView *_qrCodeImageView;
    
    NSString *_titleText;
    NSString *_detailText;
    NSString *_descText;
    NSString *_qrCodeUrlString;
}
@end

@implementation CPAddFriendRechargeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cp_AddLongPressShotScreenAction];
    _titleLabel.text = _titleText;
    _detailLabel.text = _detailText;
    _descLabel.text = _descText;
    [_qrCodeImageView sd_setImageWithURL:[NSURL URLWithString:_qrCodeUrlString]placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRetryFailed];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addTitleText:(NSString *)title
           descText:(NSString *)desc
         detailText:(NSString *)detailText
     imageUrlString:(NSString *)urlString
{
    _titleText = title;
    _detailText = detailText;
    _descText = desc;
    _qrCodeUrlString = urlString;

}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"保存图片到相册"]) {
        [self cp_ScreenShotWithView:self.view];
    }
}

@end
