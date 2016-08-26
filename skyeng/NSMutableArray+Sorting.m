//
//  NSMutableArray+Sorting.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "NSMutableArray+Sorting.h"
#include <stdlib.h>

@implementation NSMutableArray (Sorting)

- (NSMutableArray *)randomItems:(NSUInteger)count {
    NSMutableArray *result = [NSMutableArray new];
    NSMutableArray *free = self.mutableCopy;
    
    if (count > free.count) {
        count = free.count;
    }
    
    for (NSInteger i = 0; i < count; i++) {
        NSUInteger randomIndex = arc4random_uniform(free.count);
        [result addObject:free[randomIndex]];
        [free removeObjectAtIndex:randomIndex];
    }
    
    return result;
}


- (void)shuffle {
    NSUInteger count = self.count;
    if (count == 0) {
        return;
    }
    
    for (NSUInteger i = 0; i < count - 1; i++) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t)remainingCount);
        
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

@end
