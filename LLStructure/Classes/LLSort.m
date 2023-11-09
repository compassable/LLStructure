//
//  LLSort.m
//  LouLan
//
//  Created by horizon on 2023/6/7.
//

#import "LLSort.h"

@implementation LLSort
+ (NSArray *)fastSortWithArray:(NSArray *)arr
{
    NSMutableArray *array = [[NSMutableArray alloc]initWithArray:arr];
    [self quickSortArr:array withLeftIndex:0 andRightIndex:array.count -1];
    return array.copy;
}
+ (void)quickSortArr:(NSMutableArray *)array withLeftIndex:(NSInteger )leftIndex andRightIndex:(NSInteger )rightIndex{
    if (leftIndex > rightIndex) {
        return;
    }
    
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    NSInteger key = [array[i]integerValue];
    
    while (i < j) {
        while (i < j && key <= [array[j] integerValue]) {
            j --;
        }
        array[i] = array[j];
        
        while (i < j && key >= [array[i] integerValue]) {
            i ++;
        }
        array[j] = array[i];
    }
    array[i] = @(key);
    
    //前面排序
    [self quickSortArr:array withLeftIndex:leftIndex andRightIndex:i -1];
    //后面排序
    [self quickSortArr:array withLeftIndex:i + 1 andRightIndex:rightIndex];
    
}
@end
