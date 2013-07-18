//
//  BBSceneViewController.m
//  BocceBeers-iOS
//
//  Created by Stephen O'Connor on 6/3/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//

#import "BBSceneViewController.h"
#import "BBScene.h"

@interface BBSceneViewController ()

@end

@implementation BBSceneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    BBScene *scene = [self.sceneClass sceneWithViewController: self];
    
    // and add the scene to the stack. The director will run it when it automatically when the view is displayed.
    if (!_director.runningScene) {
        [_director runWithScene: scene];
    }
    else{
        [_director pushScene: scene];
    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
