//
//  TrainingsManager.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "TrainingsManager.h"

@implementation TrainingsManager

- (Training *)createTrainingWithMeanings:(NSArray<Meaning *> *)meanings {
    return self.currentTraining = [[Training alloc] initWithMeanings:meanings];
}

@end
