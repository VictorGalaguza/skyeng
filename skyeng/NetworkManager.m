//
//  NetworkManager.m
//  skyeng
//
//  Created by Victor Galaguza on 8/25/16.
//  Copyright © 2016 home. All rights reserved.
//

#import "NetworkManager.h"
#import "Constants.h"

@implementation NetworkManager

#pragma mark - Properties

- (NSURLSession *)session {
    if (!_session) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        [config setHTTPAdditionalHeaders:@{ @"Accept-Encoding" : @"gzip,deflate,sdch" }];
        [config setTimeoutIntervalForResource:kRequestTimeout];
        
        _session = [NSURLSession sessionWithConfiguration:config];
    }
    
    return _session;
}


#pragma mark - Helpers

+ (NSMutableURLRequest *)requestWithHost:(NSString *)host
                                    href:(NSString *)href {
    return [self requestWithHost:host href:href HTTPMethod:@"GET" headers:nil];
}

+ (NSMutableURLRequest *)requestWithHost:(NSString *)host
                                    href:(NSString *)href
                              HTTPMethod:(NSString *)method
                                 headers:(NSDictionary *)headers {
    // Build address.
    NSString *address = ([href length] == 0 ? host : [host stringByAppendingPathComponent:href]);
    NSURL *url = [NSURL URLWithString:address];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:method];
    
    if (headers) {
        [request setAllHTTPHeaderFields:headers];
    }
    
    return request;
}

@end
