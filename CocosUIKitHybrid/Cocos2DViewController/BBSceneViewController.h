//
//  BBSceneViewController.h
//  BocceBeers-iOS
//
//  Created by Stephen O'Connor on 6/3/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//

#import "BBCocos2DViewController.h"
#import "BBScene.h"

@interface BBSceneViewController : BBCocos2DViewController

@property (nonatomic, strong) Class<BBSceneProtocol> sceneClass;

@end
