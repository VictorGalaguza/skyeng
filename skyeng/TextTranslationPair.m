//
//  TextTranslationPair.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "TextTranslationPair.h"
#import "NSDictionary+Safe.h"

@implementation TextTranslationPair

#pragma mark - Init

- (instancetype)initWithInfo:(NSDictionary<NSString *, NSString *> *)info {
    self = [super init];
    if (self) {
        self.text = [info safeValueForKey:@"text"];
        self.translation = [info safeValueForKey:@"translation"];
    }
    
    return self;
}


#pragma mark - Helpers

- (BOOL)isEqual:(TextTranslationPair *)object {
    if ([self.text isEqualToString:object.text] &&
        [self.translation isEqualToString:object.translation]) {
        return YES;
    }
    
    return NO;
}

@end
