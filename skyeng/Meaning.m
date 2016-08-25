//
//  Meaning.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "Meaning.h"
#import "NSDictionary+Safe.h"
#import "NSMutableArray+Sorting.h"

static NSInteger const kCountOptions = 4;

@implementation Meaning

#pragma mark - Init

- (instancetype)initWithInfo:(NSDictionary<NSString *, id> *)info {
    self = [super init];
    if (self) {
        self.meaningId = [[info safeValueForKey:@"meaningId"] integerValue];
        
        // Correct text/translation.
        self.textTranslationPair = [[TextTranslationPair alloc] initWithInfo:info];
        
        // Alternatives.
        NSMutableArray<TextTranslationPair *> *alternatives = [NSMutableArray new];
        for (NSDictionary *alternativeInfo in [info safeValueForKey:@"alternatives"]) {
            [alternatives addObject:[[TextTranslationPair alloc] initWithInfo:alternativeInfo]];
        }
        self.alternatives = alternatives;

        // Images.
        self.imageUrls = [info safeValueForKey:@"images"];
    }
    
    return self;
}


#pragma mark - Helpers

- (NSArray<TextTranslationPair *> *)getOptions {
    NSMutableArray<TextTranslationPair *> *result = [NSMutableArray new];
    
    // Add correct option.
    [result addObject:self.textTranslationPair];
    
    // Add alternative options.
    [result addObjectsFromArray:[(NSMutableArray *)self.alternatives randomItems:kCountOptions - 1]];
    
    // Shuffle options.
    [result shuffle];
    
    return result;
}

- (BOOL)isCorrectTTP:(TextTranslationPair *)ttp {
    return [self.textTranslationPair isEqual:ttp];
}

@end

/*
Example:

{
    "meaningId": "211138",
    "posCode": "n",
    "isDeleted": 0,
    "isAllowedForStudy": 1,
    "text": "raspberry",
    "translation": "малина",
    "definition": "A small dark red soft berry that grows on bushes.",
    "example": "Is there any [raspberry] jam left?.",
    "properties": {
        "countability": "c",
        "irregular_plural": false,
        "false_friends": []
    },
    "transcription": "ˈrɑːzbəri",
    "updatedAt": "2016-07-22 09:53:52",
    "soundUrl": "//dictionary.skyeng.ru/media/audio/w007607.mp3",
    "alternatives": [
                     {
                         "text": "bubble",
                         "translation": "пузырь"
                     },
                     {
                         "text": "initiation",
                         "translation": "инициация"
                     },
                     {
                         "text": "starlight",
                         "translation": "звездный свет"
                     },
                     {
                         "text": "satiety",
                         "translation": "насыщение"
                     },
                     {
                         "text": "quarter",
                         "translation": "квартал"
                     },
                     {
                         "text": "tularemia",
                         "translation": "туляремия"
                     },
                     {
                         "text": "variant",
                         "translation": "разновидность"
                     },
                     {
                         "text": "incubation",
                         "translation": "инкубация"
                     },
                     {
                         "text": "criminality",
                         "translation": "криминальность"
                     },
                     {
                         "text": "exercise",
                         "translation": "зарядка"
                     }
                     ],
    "images": [
               "//static.skyeng.ru/image/download/project/dictionary/id/65218/width/320/height/240/quality/50"
               ]
}
*/