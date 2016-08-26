//
//  ProgressView.m
//  skyeng
//
//  Created by Victor Galaguza on 8/26/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "ProgressView.h"

static NSTimeInterval const SetValueAnimationDuration = 0.3;

@interface ProgressView ()

@property (strong, nonatomic) UIView *progressView;

// Helpers.
- (void)setup;

@end

@implementation ProgressView {
    CGFloat _value;
}

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    
    return self;
}


#pragma mark - Properties

- (float)value {
    return _value;
}

- (void)setValue:(CGFloat)value {
    _value = value;
    
    if (_value > 1.0f) {
        _value = 1.0f;
    } else if (_value < 0.0f) {
        _value = 0.0f;
    }
    
    self.progressView.hidden = (_value == 0.0f ? YES : NO);
}


#pragma mark - UIView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.progressView.frame = (CGRect){
        .origin.x = 0.0f,
        .origin.y = 0.0f,
        .size.width = self.bounds.size.width * _value,
        .size.height = self.bounds.size.height
    };
}


#pragma mark - Helpers

- (void)setup {
    UIColor *color = [UIColor colorWithRed:221 / 255.0 green:221 / 255.0 blue:221 / 255.0 alpha:1.0];
    float cornerRadius = self.bounds.size.height / 2.0f;
    
    // Prepare control.
    self.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = color.CGColor;
    self.layer.cornerRadius = cornerRadius;
    
    // Prepare progress.
    self.progressView = [UIView new];
    self.progressView.backgroundColor = color;
    self.progressView.layer.cornerRadius = cornerRadius;
    [self addSubview:self.progressView];
}

- (void)setAndAnimateValueFrom:(CGFloat)fromValue to:(CGFloat)toValue {
    self.value = toValue;
    
    if (self.progressView.hidden) {
        return;
    }
    
    self.progressView.frame = (CGRect){
        .origin.x = 0.0f,
        .origin.y = 0.0f,
        .size.width = self.bounds.size.width * fromValue,
        .size.height = self.bounds.size.height
    };
    
    // Animation.
    [UIView animateWithDuration:SetValueAnimationDuration delay:0.0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        self.progressView.frame = (CGRect){
            .origin.x = 0.0f,
            .origin.y = 0.0f,
            .size.width = self.bounds.size.width * _value,
            .size.height = self.bounds.size.height
        };
    } completion:nil];
}

@end
