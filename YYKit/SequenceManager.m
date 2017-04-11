//
//  SequenceManager.m
//  YYKitDemo
//
//  Created by 王昱斌 on 17/4/8.
//  Copyright © 2017年 ibireme. All rights reserved.
//

#import "SequenceManager.h"

@implementation SequenceManager


static SequenceManager * single = nil;

+(SequenceManager *)shared{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [SequenceManager new];
    });
    return single;
}

#pragma 冒泡排序
-(NSArray *)bubbleSort:(NSArray *)arr{
    NSMutableArray *array = [[NSMutableArray alloc]initWithArray:arr];
    for (int i = 0; i < array.count; i++) {
        for (int j = i + 1; j < array.count; j++) {
            if ([array[i] integerValue] > [array[j] integerValue]) {
                [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    return array;
}
#pragma 选择排序
-(NSArray *)selectSort:(NSArray *)arr{
    NSMutableArray *array = [[NSMutableArray alloc]initWithArray:arr];
    for (int i = 0; i < array.count; i++) {
        int min_index = i;
        for (int j = i + 1; j < array.count; j++) {
            if ([array[j] integerValue] < [array[min_index] integerValue]) {
                min_index = j;
            }
            if (min_index != i) {
                [array exchangeObjectAtIndex:min_index withObjectAtIndex:i];
            }
        }
    }
    return array;
}
#pragma 快速排序
-(NSArray *)quickSortDataArray:(NSArray *)arr withStartIndex:(NSInteger)startIndex andEndIndex:(NSInteger)endIndex{
    if (startIndex >= endIndex) {
        return arr;
    }
    NSMutableArray *array = [[NSMutableArray alloc]initWithArray:arr];
    NSInteger i = startIndex;
    NSInteger j = endIndex;
    NSInteger key = [array[i] integerValue];
    while (i < j) {
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        array[i] = array[j];
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
        array[j] = array[i];
    }
    array[i] = @(key);
    [array setArray:[self quickSortDataArray:array withStartIndex:startIndex andEndIndex:i - 1]];
    [array setArray:[self quickSortDataArray:array withStartIndex:i + 1 andEndIndex:endIndex]];
    return array;
}
#pragma 堆排序
@end
