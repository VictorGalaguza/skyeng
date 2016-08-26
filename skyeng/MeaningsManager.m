//
//  MeaningsManager.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "MeaningsManager.h"
#import <UIKit/UIKit.h>
#import "Engine.h"
#import "NSMutableArray+Sorting.h"

@implementation MeaningsManager {
    NSArray *_allMeaningIds;
    CGFloat _screenWidth;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _allMeaningIds = @[ @(211138), @(226138), @(177344), @(196957), @(224324), @(89785), @(79639), @(173148), @(136709), @(158582), @(92590), @(135793), @(68068), @(64441), @(46290), @(128173), @(51254), @(55112), @(222435) ];
        _screenWidth = [UIScreen mainScreen].bounds.size.width;
    }
    
    return self;
}


#pragma mark - API

/*
 Note:
 Sometimes server returns empty translates (rus) for example: viaticus, bruneian etc.
 So, app will display empty option button.
 */
- (void)getMeaningsWithIds:(NSArray<NSNumber *> *)meaningIds callback:(MeaningsLoadedCallback)callback {
    NSString *meaningIdsString = [meaningIds componentsJoinedByString:@","];
    
    NSURLRequest *request = [NetworkManager requestWithHost:kSkyEngDictionaryApiUrl
                                                       href:[NSString stringWithFormat:@"wordtasks?meaningIds=%@&width=%.0f",
                                                             meaningIdsString, _screenWidth]];
    
    NSURLSessionDataTask *task = [[Engine sharedEngine].networkManager.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray<Meaning *> *meanings = nil;
        
        if (!error) {
            // Parse.
            id array = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (!error) {
                meanings = [NSMutableArray new];
                
                for (NSDictionary *meaningInfo in array) {
                    [meanings addObject:[[Meaning alloc] initWithInfo:meaningInfo]];
                }
            }
        }
        
        if (callback) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                callback(meanings, error);
            }];
        }
    }];
    [task resume];
}


#pragma mark - Helpers

- (NSArray<NSNumber *> *)getRandomMeaningIds:(NSUInteger)count {
    return [_allMeaningIds.mutableCopy randomItems:count];
}

@end
