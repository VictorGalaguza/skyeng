//
//  Engine.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "Engine.h"

@implementation Engine

#pragma mark - Singleton

+ (Engine *)sharedEngine {
    static Engine *instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    
    return instance;
}

@end
