//
//  BBLayer.m
//  BocceBeers-iOS
//
//  Created by Stephen O'Connor on 6/13/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//

#import "CCNode+BocceBeers.h"
#import "BBScene.h"

@implementation CCNode(BocceBeers)

- (UIViewController*)viewController
{
    return self.scene.viewController;
}

- (BBScene*)scene
{
    CCNode *parent = self;
    while (parent && ![parent isKindOfClass: [BBScene class]]) {
        parent = parent.parent;
    }
 
    BBScene *scene = (BBScene*)parent;
    
    if (scene) {
        NSAssert([scene isKindOfClass: [BBScene class]], @"Should have found a BBScene object");
    }
    
    return scene;
}

@end
