//
//  UIView+Border.h
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Border)

@property (assign, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;

@end
