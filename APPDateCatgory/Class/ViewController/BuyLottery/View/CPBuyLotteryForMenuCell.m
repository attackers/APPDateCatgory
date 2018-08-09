//
//  CPBuyLotteryForMenuCell.m
//  lottery
//
//  Created by way on 2018/3/23.
//  Copyright © 2018年 way. All rights reserved.
//

#import "CPBuyLotteryForMenuCell.h"

@interface CPBuyLotteryForMenuCell()
{
    
    IBOutlet UIButton *_actionButton;
    IBOutlet UIImageView *_pointImgView;
    IBOutlet UILabel *_nameLabel;
    
}
@end

@implementation CPBuyLotteryForMenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setName:(NSString *)name
{
    _name = name;
    _nameLabel.text = name;
    
}

-(void)setHasSelected:(BOOL)hasSelected
{
    _hasSelected = hasSelected;
    if (hasSelected) {
        _pointImgView.highlighted = YES;
        _actionButton.selected = YES;
    }else{
        _pointImgView.highlighted = NO;
        _actionButton.selected = NO;
    }
}



@end
