//
//  PhotoController.m
//  PhotoBombers
//
//  Created by Joao Pescada on 05/06/2014.
//  Copyright (c) 2014 Joao Pescada. All rights reserved.
//

#import "PhotoController.h"
#import <SAMCache/SAMCache.h>

@implementation PhotoController

+ (void)imageForPhoto:(NSDictionary *)photo size:(NSString *)size completion:(void(^)(UIImage *image))completion {
    
    if (photo == nil || size == nil || completion == nil) {
        NSLog(@"ERROR: No params set on PhotoController.imageForPhoto");
        return;
    }
    
    NSString *key = [NSString stringWithFormat:@"%@-%@",photo[@"id"], size];
    UIImage *image = [[SAMCache sharedCache] imageForKey:key];
    
    if (image) {
        completion(image);
        return;
    }
    
    NSURL *url = [NSURL URLWithString:photo[@"images"][size][@"url"]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [[UIImage alloc] initWithData:data];
        
        [[SAMCache sharedCache] setImage:image forKey:key];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(image);
        });
    }];
    [task resume];
    
}

@end
