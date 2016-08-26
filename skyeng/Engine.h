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

@property (strong, nonatomic) NetworkManager *networkManager;
@property (strong, nonatomic) MeaningsManager *meaningsManager;
@property (strong, nonatomic) TrainingsManager *trainingsManager;

@end
