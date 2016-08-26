//
//  NavigationControllerDelegate.m
//  skyeng
//
//  Created by Victor Galaguza on 8/26/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "ProgressScreenPushTransition.h"
#import "ProgressViewController.h"

@interface NavigationControllerDelegate ()

@property (strong, nonatomic) ProgressScreenPushTransition *progressScreenPushTransition;

@end

@implementation NavigationControllerDelegate

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    switch (operation) {
        case UINavigationControllerOperationPush: {
            if ([fromVC isKindOfClass:[ProgressViewController class]] &&
                [toVC isKindOfClass:[ProgressViewController class]]) {
                
                if (!self.progressScreenPushTransition) {
                    self.progressScreenPushTransition = [ProgressScreenPushTransition new];
                }
                
                return self.progressScreenPushTransition;
            }
            break;
        }
            
        default:
            break;
    }
    
    return nil;
}

@end
