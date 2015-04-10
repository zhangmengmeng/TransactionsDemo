//
//  main.m
//  TransactionsDemo
//
//  Created by qingyun on 15-1-29.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Transcation.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 日历的简单用法
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *componet = [[NSDateComponents alloc] init];
        
        componet.year = 2015;
        componet.month = 1;
        componet.day = 29;
        
        NSDate *date1 = [calendar dateFromComponents:componet];
        
        
        //NSLocale *chLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        NSLocale *chLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        
        NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
        dateFormater.timeStyle = kCFDateFormatterNoStyle;
        dateFormater.dateStyle = kCFDateFormatterMediumStyle;
        dateFormater.locale = chLocale;
        
        NSLog(@"date >>>>>>>>> %@", date1);
        NSLog(@"date >>>>>>>>> %@", [dateFormater stringFromDate:date1]);
        
        
        
        Transcation *t1 = [[Transcation alloc] init];
        t1.name = @"杨开国";
        t1.amount = 20000;
        
        componet.year = 2015;
        componet.month = 11;
        componet.day = 12;
        t1.date = [calendar dateFromComponents:componet];
        
        Transcation *t2 = [[Transcation alloc] init];
        t2.name = @"张旭";
        t2.amount = 20001;
        
        componet.year = 2014;
        componet.month = 11;
        componet.day = 12;
        t2.date = [calendar dateFromComponents:componet];
        
        Transcation *t3 = [[Transcation alloc] init];
        t3.name = @"张东东";
        t3.amount = 30000;
        
        componet.year = 2014;
        componet.month = 12;
        componet.day = 12;
        t3.date = [calendar dateFromComponents:componet];
        
        
        Transcation *t4 = [[Transcation alloc] init];
        t4.name = @"郭进前";
        t4.amount = 30000;
        
        componet.year = 2014;
        componet.month = 12;
        componet.day = 16;
        t4.date = [calendar dateFromComponents:componet];
        
        NSArray *array = @[t1, t2, t3, t4];
        /*----------KVC的快速运算-----------*/
        NSLog(@"count of array:%d", [[array valueForKey:@"@count"] intValue]); //kvc快速运算，计算总数
        NSLog(@"avg of array.amount:%.2f", [[array valueForKeyPath:@"@avg.amount"] doubleValue]); //kvc求平均值
        
        NSLog(@"max of array.date:%@", [dateFormater stringFromDate:[array valueForKeyPath:@"@max.date"]]); //kvc求最大值
        
        NSLog(@"min of array.amount:%.2f", [[array valueForKeyPath:@"@min.amount"] doubleValue]); //kvc最小值
    
        NSLog(@"sum of array.amount:%.2f", [[array valueForKeyPath:@"@sum.amount"] doubleValue]); //kvc求和
        
        NSLog(@"sum of array.amount:%@", [array valueForKeyPath:@"@distinctUnionOfObjects.amount"]); //kvc求不重复的值
        
    }
    return 0;
}

