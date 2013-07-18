//
//  BBScene.m
//  BocceBeers-iOS
//
//  Created by Stephen O'Connor on 6/13/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//

#import "BBScene.h"

@implementation BBScene

@synthesize viewController = _viewController;

+ (BBScene*)sceneWithViewController:(UIViewController*)vc
{
    BBScene *scene = [self node];
    scene.viewController = vc;
    return scene;
}

@end
