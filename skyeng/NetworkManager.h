//
//  NetworkManager.h
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

@property (strong, nonatomic) NSURLSession *session;

// Helpers.
+ (NSMutableURLRequest *)requestWithHost:(NSString *)host
                                    href:(NSString *)href;
+ (NSMutableURLRequest *)requestWithHost:(NSString *)host
                                    href:(NSString *)href
                              HTTPMethod:(NSString *)method
                                 headers:(NSDictionary *)headers;

@end
