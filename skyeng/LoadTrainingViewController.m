//
//  LoadTrainingViewController.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "LoadTrainingViewController.h"
#import "Engine.h"

static NSString * const WordTaskSegue = @"WordTaskSegue";

@implementation LoadTrainingViewController

#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak LoadTrainingViewController *weakSelf = self;
    
    NSArray<NSNumber *> *randomMeaningIds = [[Engine sharedEngine].meaningsManager getRandomMeaningIds:kCountQuestionsPerTraining];
    
    // Get meanings from server.
    [[Engine sharedEngine].meaningsManager getMeaningsWithIds:randomMeaningIds callback:^(NSArray<Meaning *> *meanings, NSError *error) {
        if (error) {
            // Some error handling can be here.
            return;
        }
        
        // Create training.
        [[Engine sharedEngine].trainingsManager createTrainingWithMeanings:meanings];
        
        // Go to the first word task in the training.
        [weakSelf performSegueWithIdentifier:WordTaskSegue sender:nil];
    }];
}

@end
