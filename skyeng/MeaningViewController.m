//
//  MeaningViewController.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "MeaningViewController.h"
#import "Engine.h"

static NSString * const NextMeaningSegue = @"NextMeaningSegue";
static NSString * const ResultsSegue = @"ResultsSegue";

@interface MeaningViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *translationLabel;

@end

@implementation MeaningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Meaning *meaning = [[Engine sharedEngine].trainingsManager.currentTraining currentMeaning];
    
    self.textLabel.text = meaning.textTranslationPair.text;
    self.imageView.image = nil;
    self.translationLabel.text = meaning.textTranslationPair.translation;
}


#pragma mark - IBAction

- (IBAction)nextTouched:(id)sender {
    Meaning *nextMeaning = [[Engine sharedEngine].trainingsManager.currentTraining nextMeaning];
    
    // Go to the next meaning screen or to the results screen depends on availability of next meaning.
    [self performSegueWithIdentifier:(nextMeaning ? NextMeaningSegue : ResultsSegue)
                              sender:nil];
}

@end
