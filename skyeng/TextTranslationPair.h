//
//  TextTranslationPair.h
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextTranslationPair : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *translation;

// Init.
- (instancetype)initWithInfo:(NSDictionary<NSString *, NSString *> *)info;

// Helpers.
- (BOOL)isEqual:(TextTranslationPair *)object;

@end
