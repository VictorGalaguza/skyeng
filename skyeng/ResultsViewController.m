//
//  ResultsViewController.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "ResultsViewController.h"
#import "Engine.h"
#import "UIStoryboard+Helper.h"

@interface ResultsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSRange result = [[Engine sharedEngine].trainingsManager.currentTraining getResult];
    
    self.resultLabel.text = [NSString stringWithFormat:@"%tu / %tu", result.location, result.length];
}


#pragma mark - IBAction

- (IBAction)oneMoreTimeTouched:(id)sender {
    UIViewController *loadingTrainingScreen = [UIStoryboard viewController:kLoadTrainingScreen inStoryboard:kMainStoryboard];
    
    self.navigationController.viewControllers = @[ loadingTrainingScreen ];
}

@end
