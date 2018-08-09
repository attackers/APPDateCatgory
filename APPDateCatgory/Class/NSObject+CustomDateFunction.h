//
//  NSObject+CustomDateFunction.h
//  APPDateCatgory
//
//  Created by OS X10_12_6 on 2018/8/9.
//  Copyright © 2018年 OS X10_12_6. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CustomDateFunction)
+ (NSInteger)dateToDateBetweenHowDay:(NSDate*)oldDate  nowDate:(NSDate*)now;
+ (NSInteger)dateStgToDateStgBetweenHowDay:(NSString*)oldDate  nowDate:(NSString*)now;
+ (NSDate*)stringToDate:(NSString*)stg;
+ (NSString*)dateToString:(NSDate*)stg;
@end
