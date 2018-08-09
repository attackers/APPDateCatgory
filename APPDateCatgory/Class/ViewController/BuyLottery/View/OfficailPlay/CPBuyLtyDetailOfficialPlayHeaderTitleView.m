//
//  CPBuyLtyDetailOfficialPlayHeaderTitleView.m
//  lottery
//
//  Created by way on 2018/6/30.
//  Copyright © 2018年 way. All rights reserved.
//

#import "CPBuyLtyDetailOfficialPlayHeaderTitleView.h"
#import "DWITButton.h"
@interface CPBuyLtyDetailOfficialPlayHeaderTitleView()
{
    IBOutlet UILabel *_rateLabel;
    IBOutlet DWITButton *_titleButton;
    
}
@end

@implementation CPBuyLtyDetailOfficialPlayHeaderTitleView

-(void)addActionTarget:(id)target
              selector:(SEL)selector
{
    [_titleButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

-(void)addTitle:(NSString *)title
           rate:(NSString *)rate
 hiddenRateView:(BOOL)hiddenRateView
{
    [_titleButton setTitle:title forState:UIControlStateNormal];
    if (rate.length>0) {
        _rateLabel.text = [NSString stringWithFormat:@"赔率:%@",rate];
    }
    _rateLabel.hidden = hiddenRateView;
    self.height = hiddenRateView?_titleButton.bottomY:_rateLabel.bottomY;
}




@end
