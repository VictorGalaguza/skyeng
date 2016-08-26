//
//  ProgressView.h
//  skyeng
//
//  Created by Victor Galaguza on 8/26/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ProgressView : UIView

@property (assign, nonatomic) IBInspectable CGFloat value;

// Helpers.
- (void)setAndAnimateValueFrom:(CGFloat)fromValue to:(CGFloat)toValue;

//[progressView setAndAnimateValueFrom:fromViewController.progressView.value
//                                  to:toViewController.progressView.value];

@end
