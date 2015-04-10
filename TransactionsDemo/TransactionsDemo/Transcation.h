//
//  Transcation.h
//  TransactionsDemo
//
//  Created by qingyun on 15-1-29.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transcation : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic) double amount;

@end
