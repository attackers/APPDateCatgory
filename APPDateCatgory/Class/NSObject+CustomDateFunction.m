//
//  NSObject+CustomDateFunction.m
//  APPDateCatgory
//
//  Created by OS X10_12_6 on 2018/8/9.
//  Copyright © 2018年 OS X10_12_6. All rights reserved.
//

#import "NSObject+CustomDateFunction.h"

@implementation NSObject (CustomDateFunction)
+ (NSInteger)dateToDateBetweenHowDay:(NSDate*)oldDate  nowDate:(NSDate*)now {
    NSUInteger unitFlags = NSCalendarUnitDay;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *components = [calendar components:unitFlags fromDate:oldDate toDate:now options:0];
    return components.day;
}
+ (NSInteger)dateStgToDateStgBetweenHowDay:(NSString*)oldDate  nowDate:(NSString*)now {
    NSDate *old = [NSDate stringToDate:oldDate];
    NSDate *current = [NSDate stringToDate:now];
    return [NSDate dateToDateBetweenHowDay:old nowDate:current];
}

+ (NSDate*)stringToDate:(NSString*)stg {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:stg];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    return [date  dateByAddingTimeInterval: interval];
}


+ (NSString*)dateToString:(NSDate*)stg {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateStyle = NSDateFormatterMediumStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:stg];
}

@end
