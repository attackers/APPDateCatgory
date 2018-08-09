//
//  CPDatePickerView.h
//  lottery
//
//  Created by 施小伟 on 2018/7/22.
//  Copyright © 2018年 施冬伟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CPDatePickerViewSelectedDateAction)(BOOL isComfirm,NSDate *selectedDate);

@interface CPDatePickerView : UIView

+(void)showDatePickerOnView:(UIView *)supView
                       date:(NSDate *)date
                    comfirm:(CPDatePickerViewSelectedDateAction)confirm;

@end
