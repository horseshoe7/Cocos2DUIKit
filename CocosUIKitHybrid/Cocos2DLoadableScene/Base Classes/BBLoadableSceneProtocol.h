//
//  BBLoadableScene.h
//  BocceBeers-iOS
//
//  Created by Stephen O'Connor on 6/13/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//
/*
 
 A protocol used for scenes that can be loaded on background threads.
 
 When implementing a class that conforms to this protocol, you can generally use the default 
 behaviour of [BBScene sceneWithViewController: ...] and then implement initScene to add
 layers and other stuff.  the sceneWithViewController is meant to be a very simple and fast
 object constructor, hence using the baseclass implementation, and you do the rest of the
 instantiation on a background thread in the initScene method
 
 If your loadable scene needs access to the scene Loader (i.e. for progress bar updates)
 you can optionally support keeping a pointer to the scene loader.  As of current
 the only foreseeable use for this hook is for progress bars, but it's up to you
 and what your loading scene can do.
 
 */


#import <Foundation/Foundation.h>
#import "BBScene.h"

@class BBSceneLoader;

@protocol BBLoadableSceneProtocol <BBSceneProtocol>

@required
- (void)initScene;  // in this method, this is where you set up the things you want to load in the background


@optional
// sometimes, if your scene loading needs to update the loading scene with progress or whatever, you need a reference to him
- (void)setSceneLoader:(BBSceneLoader*)sceneLoader;
- (BBSceneLoader*)sceneLoader;

- (void)loadObjectsOnMainThread;  // if you have objects that can only be created on the main thread, do that here.  Typically CCDrawNodes

@end
