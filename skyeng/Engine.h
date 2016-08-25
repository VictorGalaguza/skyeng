//
//  Engine.h
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "NetworkManager.h"
#import "MeaningsManager.h"
#import "TrainingsManager.h"

@interface Engine : NSObject

+ (Engine *)sharedEngine;

@property (nonatomic, strong) NetworkManager *networkManager;
@property (nonatomic, strong) MeaningsManager *meaningsManager;
@property (nonatomic, strong) TrainingsManager *trainingsManager;

@end
