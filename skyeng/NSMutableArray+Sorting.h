//
//  NSMutableArray+Sorting.h
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Sorting)

- (NSMutableArray *)randomItems:(NSUInteger)count;
- (void)shuffle;

@end
