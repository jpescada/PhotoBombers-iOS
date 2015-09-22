//
//  PhotoController.h
//  PhotoBombers
//
//  Created by Joao Pescada on 05/06/2014.
//  Copyright (c) 2014 Joao Pescada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoController : NSObject

+ (void)imageForPhoto:(NSDictionary *)photo size:(NSString *)size completion:(void(^)(UIImage *image))completion;

@end
