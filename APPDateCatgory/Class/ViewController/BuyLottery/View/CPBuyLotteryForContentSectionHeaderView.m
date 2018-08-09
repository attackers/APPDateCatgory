//
//  CPBuyLotteryForContentSectionHeaderView.m
//  lottery
//
//  Created by way on 2018/3/24.
//  Copyright © 2018年 way. All rights reserved.
//

#import "CPBuyLotteryForContentSectionHeaderView.h"

@interface CPBuyLotteryForContentSectionHeaderView()
{
    
    IBOutlet UILabel *_nameLabel;
    IBOutlet UIImageView *_topLine;
    IBOutlet UIImageView *_bottomLine;
    
    
}

@end

@implementation CPBuyLotteryForContentSectionHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        [self buildSubviews];
    }
    return self;
}

-(void)buildSubviews
{
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.textColor = kCOLOR_R_G_B_A(51, 51, 51, 1);
    _nameLabel.font = [UIFont systemFontOfSize:15.0f];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_nameLabel];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    _topLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"buytry_seap_light"]];
    [self addSubview:_topLine];
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(1.0f);
    }];
    
    _bottomLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"buytry_seap_dark"]];
    [self addSubview:_bottomLine];
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(2.0f);
    }];
    
}

-(void)setName:(NSString *)name
{
    _name = name;
    _nameLabel.text = _name;
}

-(void)setIsShowTopLine:(BOOL)isShowTopLine
{
    _isShowTopLine = isShowTopLine;
    _topLine.hidden = isShowTopLine?NO:YES;
}

@end
