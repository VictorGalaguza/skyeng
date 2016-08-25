//
//  Constants.h
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>

// API.
static NSString * const kSkyEngDictionaryApiUrl = @"https://dictionary.skyeng.ru/api/v1/";

// Network.
static NSTimeInterval const kRequestTimeout = 60.0;

// Common.
static NSInteger const kCountQuestionsPerTraining = 10;

// Storyboard.
static NSString * const kMainStoryboard = @"Main";

// Screens.
static NSString * const kLoadTrainingScreen = @"LoadTrainingViewController";
static NSString * const kWordTaskScreen = @"WordTaskViewController";
static NSString * const kMeaningScreen = @"MeaningViewController";
static NSString * const kResultsScreen = @"ResultsViewController";
