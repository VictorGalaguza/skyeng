//
//  MeaningsManager.h
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Meaning.h"

// Callbacks.
typedef void (^MeaningsLoadedCallback)(NSArray<Meaning *> *meanings, NSError *error);

@interface MeaningsManager : NSObject

// API.
- (void)getMeaningsWithIds:(NSArray<NSNumber *> *)meaningIds callback:(MeaningsLoadedCallback)callback;

// Helpers.
- (NSArray<NSNumber *> *)getRandomMeaningIds:(NSUInteger)count;

@end
