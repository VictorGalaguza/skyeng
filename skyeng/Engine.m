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


#pragma mark - Properties

- (NetworkManager *)networkManager {
    if (!_networkManager) {
        _networkManager = [NetworkManager new];
    }
    
    return _networkManager;
}

- (MeaningsManager *)meaningsManager {
    if (!_meaningsManager) {
        _meaningsManager = [MeaningsManager new];
    }
    
    return _meaningsManager;
}

- (TrainingsManager *)trainingsManager {
    if (!_trainingsManager) {
        _trainingsManager = [TrainingsManager new];
    }
    
    return _trainingsManager;
}

@end
