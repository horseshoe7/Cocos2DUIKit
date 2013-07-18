//
//  BBLayer.h
//  BocceBeers-iOS
//
//  Created by Stephen O'Connor on 6/13/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//
/*
 
 You should always use these in the app instead of CCLayers because they interact with UIKit objects better
 
 */

#import "CCNode.h"

@class BBScene;

@interface CCNode(BocceBeers)

// goes back up its hierarchy until it finds a BBScene node and asks for its viewController property
@property (nonatomic, readonly) UIViewController *viewController;
@property (nonatomic, readonly) BBScene *scene;

@end
