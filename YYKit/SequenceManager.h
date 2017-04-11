//
//  SequenceManager.h
//  YYKitDemo
//
//  Created by 王昱斌 on 17/4/8.
//  Copyright © 2017年 ibireme. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SequenceManager : NSObject

+(SequenceManager *)shared;

-(NSArray *)bubbleSort:(NSArray *)arr;

-(NSArray *)selectSort:(NSArray *)arr;

-(NSArray *)quickSortDataArray:(NSArray *)arr withStartIndex:(NSInteger)startIndex andEndIndex:(NSInteger)endIndex;
@end
