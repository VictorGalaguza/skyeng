//
//  UIStoryboard+Helper.h
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIStoryboard (Helper)

+ (UIViewController *)viewController:(NSString *)viewControllerName
                        inStoryboard:(NSString *)storyboardName;

@end
