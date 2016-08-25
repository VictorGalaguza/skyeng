//
//  UIStoryboard+Helper.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "UIStoryboard+Helper.h"

@implementation UIStoryboard (Helper)

+ (UIViewController *)viewController:(NSString *)viewControllerName
                        inStoryboard:(NSString *)storyboardName {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    if (sb) {
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:viewControllerName];
        if (vc) {
            return vc;
        }
    }
    
    return nil;
}

@end
