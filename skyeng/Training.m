//
//  Training.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "Training.h"
#import "TextTranslationPair.h"

@interface Training ()

@property (nonatomic, strong) NSArray<Meaning *> *meanings;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, TextTranslationPair *> *answers; // meaningId -> TTP

@property (nonatomic, assign) NSInteger currentMeaningIndex;

@end

@implementation Training

#pragma mark - Init

- (instancetype)initWithMeanings:(NSArray<Meaning *> *)meanings {
    self = [super init];
    if (self) {
        self.meanings = meanings;
        self.answers = [NSMutableDictionary new];
    }
    
    return self;
}


#pragma mark - Helpers

- (Meaning *)currentMeaning {
    Meaning *result = nil;
    
    if (self.currentMeaningIndex >= 0 && self.currentMeaningIndex < self.meanings.count) {
        result = self.meanings[self.currentMeaningIndex];
    }
    
    return result;
}

- (Meaning *)nextMeaning {
    Meaning *result = nil;
    
    self.currentMeaningIndex++;
    
    if (self.currentMeaningIndex < self.meanings.count) {
        result = self.meanings[self.currentMeaningIndex];
    }
    
    return result;
}

- (NSRange)getResult {
    NSInteger countCorrectAnswers = 0;
    
    for (NSInteger i = 0; i < self.meanings.count; i++) {
        Meaning *meaning = self.meanings[i];
        NSNumber *key = @(meaning.meaningId);
        
        if ([meaning isCorrectTTP:self.answers[key]]) {
            countCorrectAnswers++;
        }
    }
    
    return NSMakeRange(countCorrectAnswers, self.meanings.count);
}

- (void)saveChoosenOption:(TextTranslationPair *)ttp {
    Meaning *meaning = self.meanings[self.currentMeaningIndex];
    NSNumber *key = @(meaning.meaningId);
    
    self.answers[key] = ttp;
}

@end
