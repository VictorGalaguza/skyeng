//
//  Meaning.h
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TextTranslationPair.h"

@interface Meaning : NSObject

@property (nonatomic, assign) NSInteger meaningId;
@property (nonatomic, strong) TextTranslationPair *textTranslationPair;
@property (nonatomic, strong) NSArray<TextTranslationPair *> *alternatives;
@property (nonatomic, strong) NSArray<NSString *> *imageUrls;

// Init.
- (instancetype)initWithInfo:(NSDictionary<NSString *, id> *)info;

// Helpers.
- (NSArray<TextTranslationPair *> *)getOptions;
- (BOOL)isCorrectTTP:(TextTranslationPair *)ttp;

@end
