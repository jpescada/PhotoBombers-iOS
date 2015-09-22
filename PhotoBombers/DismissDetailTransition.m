//
//  DismissDetailTransition.m
//  PhotoBombers
//
//  Created by Joao Pescada on 06/06/2014.
//  Copyright (c) 2014 Joao Pescada. All rights reserved.
//

#import "DismissDetailTransition.h"

@implementation DismissDetailTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *detail = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [UIView animateWithDuration:0.3 animations:^{
        detail.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        [detail.view removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

@end
