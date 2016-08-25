//
//  TrainingsManager.h
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Training.h"

@interface TrainingsManager : NSObject

@property (strong, nonatomic) Training *currentTraining;

- (Training *)createTrainingWithMeanings:(NSArray<Meaning *> *)meanings;

@end
