//
//  BBScene.h
//  BocceBeers-iOS
//
//  Created by Stephen O'Connor on 6/13/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//

#import "CCScene.h"

@class BBScene;

// a scene object is a top-level node, which usually means it belongs to a UIKit View Controller.
// one should therefore always pass along a view controller object between scenes

// you implement the BBSceneProtocol for any scene you create (if you create one from a layer) so that it can talk to its
// parent UIViewController easily.

@protocol BBSceneProtocol <NSObject>

+ (BBScene*)sceneWithViewController:(UIViewController*)vc;

@end



@interface BBScene : CCScene<BBSceneProtocol>
{
    @protected
    __weak UIViewController *_viewController;
}
@property (nonatomic, weak) UIViewController *viewController;

@end
