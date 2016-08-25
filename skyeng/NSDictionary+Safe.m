//
//  NSDictionary+Safe.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)

- (nullable id)safeValueForKey:(nonnull NSString *)key; {
    id obj = [self objectForKey:key];
    if (obj == [NSNull null]) {
        return nil;
    }
    
    return obj;
}

@end
