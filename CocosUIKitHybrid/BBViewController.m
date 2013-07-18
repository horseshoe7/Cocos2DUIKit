//
//  BBViewController.m
//  CocosUIKitHybrid
//
//  Created by Stephen O'Connor on 7/18/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//

#import "BBViewController.h"
#import "BBSceneViewController.h"
#import "BBGameSceneLoader.h"

@interface BBViewController ()

@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushScene:(id)sender
{
    BBSceneViewController *sceneVC = [[BBSceneViewController alloc] init];
    sceneVC.sceneClass = [BBGameSceneLoader class];
    
    [self.navigationController pushViewController: sceneVC  animated:YES];
    
}

@end
