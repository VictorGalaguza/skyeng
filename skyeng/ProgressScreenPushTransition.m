//
//  ProgressScreenPushTransition.m
//  skyeng
//
//  Created by Victor Galaguza on 8/26/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "ProgressScreenPushTransition.h"
#import "ProgressViewController.h"

static NSTimeInterval const AnimationDuration = 0.3;

@implementation ProgressScreenPushTransition

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return AnimationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    ProgressViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    ProgressViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // Prepare the "from" controller.
    fromViewController.progressView.hidden = YES;
    
    // Prepare the "to" controller.
    toViewController.progressView.hidden = YES;
    toViewController.view.frame = (CGRect){
        .origin.x = toViewController.view.bounds.size.width,
        .origin.y = 0.0f,
        .size.width = toViewController.view.bounds.size.width,
        .size.height = toViewController.view.bounds.size.height
    };
    [[transitionContext containerView] addSubview:toViewController.view];
    
    // Add temporary progress view control.
    ProgressView *progressView = [[ProgressView alloc] initWithFrame:fromViewController.progressView.frame];
    [progressView setAndAnimateValueFrom:fromViewController.progressView.value
                                      to:toViewController.progressView.value];
    [[transitionContext containerView] addSubview:progressView];
    
    // Animate.
    [UIView animateWithDuration:AnimationDuration delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        // Move "from" controller out of the screen.
        fromViewController.view.frame = (CGRect){
            .origin.x = -(fromViewController.view.bounds.size.width / 3.0f),
            .origin.y = 0.0f,
            .size.width = fromViewController.view.bounds.size.width,
            .size.height = fromViewController.view.bounds.size.height
        };
        fromViewController.view.alpha = 0.9f;
        
        // Move "to" controller on the screen.
        toViewController.view.frame = (CGRect){
            .origin.x = 0.0f,
            .origin.y = 0.0f,
            .size.width = toViewController.view.bounds.size.width,
            .size.height = toViewController.view.bounds.size.height
        };
        toViewController.view.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        toViewController.view.layer.shadowOffset = CGSizeMake(-3.0f, 0.0f);
        toViewController.view.layer.shadowOpacity = 0.3f;
        toViewController.view.layer.shadowRadius = 3.0f;
        
    } completion:^(BOOL finished) {
        // Display real progress view.
        toViewController.progressView.hidden = NO;
        
        // Remove fake progress view.
        [progressView removeFromSuperview];

        // Transition is finished.
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
