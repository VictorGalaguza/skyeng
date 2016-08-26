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

@property (assign, nonatomic) NSInteger meaningId;
@property (strong, nonatomic) TextTranslationPair *textTranslationPair;
@property (strong, nonatomic) NSArray<TextTranslationPair *> *alternatives;
@property (strong, nonatomic) NSArray<NSString *> *imageUrls;

// Init.
- (instancetype)initWithInfo:(NSDictionary<NSString *, id> *)info;

// Helpers.
- (NSArray<TextTranslationPair *> *)getOptions;
- (BOOL)isCorrectTTP:(TextTranslationPair *)ttp;
- (NSURL *)defaultImageUrl;
- (NSURL *)defaultImageUrlWithQuality:(float)quality; // quality: 0.0f ... 1.0f, or -1.0f if default quality is needed.

@end
