//
//  NSDictionary+Safe.h
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)

- (nullable id)safeValueForKey:(nonnull NSString *)key;

@end
