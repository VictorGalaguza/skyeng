//
//  Training.h
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Meaning.h"
#import "TextTranslationPair.h"

@interface Training : NSObject

// Init.
- (instancetype)initWithMeanings:(NSArray<Meaning *> *)meanings;

// Helpers.
- (Meaning *)currentMeaning;
- (Meaning *)nextMeaning;
- (float)getProgress; // returns 0.0f ... 1.0f
- (NSRange)getResult;
- (void)saveChoosenOption:(TextTranslationPair *)ttp;

@end
