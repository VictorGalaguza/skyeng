//
//  WordTaskViewController.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "WordTaskViewController.h"
#import "Engine.h"
#import <SDWebImage/SDWebImageManager.h>

static NSString * const MeaningSegue = @"MeaningSegue";

@interface WordTaskViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *optionButtons;
@property (weak, nonatomic) IBOutlet UIButton *idkButton;

@property (strong, nonatomic) NSArray<TextTranslationPair *> *options;

// Helpers.
- (void)disableAllButtons;
- (void)animateOptionsWithColors;
- (void)loadingDefaultImageOfMeaning;

@end

@implementation WordTaskViewController

#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get options.
    Meaning *meaning = [[Engine sharedEngine].trainingsManager.currentTraining currentMeaning];
    self.options = [meaning getOptions];
    
    self.textLabel.text = meaning.textTranslationPair.text;
    
    // Fill options.
    for (NSUInteger i = 0; i < self.options.count; i++) {
        [self.optionButtons[i] setTitle:self.options[i].translation
                               forState:UIControlStateNormal];
    }
    
    // Set progress.
    self.progressView.value = [[Engine sharedEngine].trainingsManager.currentTraining getProgress];
    
    [self loadingDefaultImageOfMeaning];
}


#pragma mark - IBAction

- (IBAction)optionTouched:(id)sender {
    NSUInteger optionIndex = [self.optionButtons indexOfObject:sender];
    TextTranslationPair *ttp = self.options[optionIndex];
    
    // Save option.
    [[Engine sharedEngine].trainingsManager.currentTraining saveChoosenOption:ttp];
    
    // For preventing touches on another options while animation is playing.
    [self disableAllButtons];
    
    // Animate.
    [self animateOptionsWithColors];
}

- (IBAction)idkTouched:(id)sender {
    // Go to the meaning screen.
    [self performSegueWithIdentifier:MeaningSegue sender:nil];
}


#pragma mark - Helpers

- (void)disableAllButtons {
    for (UIButton *button in self.optionButtons) {
        button.enabled = NO;
    }
    
    self.idkButton.enabled = NO;
}

- (void)animateOptionsWithColors {
    Meaning *meaning = [[Engine sharedEngine].trainingsManager.currentTraining currentMeaning];
    
    __weak WordTaskViewController *weakSelf = self;
    
    [UIView animateWithDuration:1.0 animations:^{
        for (NSUInteger i = 0; i < weakSelf.options.count; i++) {
            TextTranslationPair *ttp = weakSelf.options[i];
            UIButton *button = weakSelf.optionButtons[i];
            
            button.layer.borderColor = [UIColor whiteColor].CGColor;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

            if ([meaning isCorrectTTP:ttp]) {
                button.backgroundColor = [UIColor colorWithRed:173 / 255.0 green:209 / 255.0 blue:102 / 255.0 alpha:1.0];
            } else {
                button.backgroundColor = [UIColor colorWithRed:1.0 green:128 / 255.0 blue:128 / 255.0 alpha:1.0];
            }
        }
    } completion:^(BOOL finished) {
        // Go to the meaning screen.
        [weakSelf performSegueWithIdentifier:MeaningSegue sender:nil];
    }];
}

- (void)loadingDefaultImageOfMeaning {
    Meaning *meaning = [[Engine sharedEngine].trainingsManager.currentTraining currentMeaning];
    NSURL *imageUrl = [meaning defaultImageUrlWithQuality:1.0f];
    if (!imageUrl) {
        return;
    }
    
    // Start load the default image for current meaning that we will display on the meaning screen.
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:imageUrl options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        NSLog(@"loading %@ -> %ld or %ld", imageUrl.absoluteString, (long)receivedSize, (long)expectedSize);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//        if (image) {
//            NSLog(@"loading finished %@", imageUrl.absoluteString);
//        } else {
//            NSLog(@"loading failed %@", imageUrl.absoluteString);
//        }
    }];
}

@end
