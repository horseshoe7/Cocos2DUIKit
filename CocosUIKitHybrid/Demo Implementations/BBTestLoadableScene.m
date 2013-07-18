//
//  BBTestLoadableScene.m
//  BocceBeers-iOS
//
//  Created by Stephen O'Connor on 6/13/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//

#import "BBTestLoadableScene.h"
#import "BBScene.h"
#import "CCNode+BocceBeers.h"

@implementation BBTestLoadableScene

- (void)initScene
{
    // 'layer' is an autorelease object.
	BBTestLoadableSceneLayer *layer = [BBTestLoadableSceneLayer node];
	
	// add layer as a child to scene
	[self addChild: layer];
}




@end



@implementation BBTestLoadableSceneLayer


- (id)init
{
    self = [super init];
    if (self) {
        
        [self createMenu];
    }
    return self;
}

- (void)createMenu
{
	// Default font size will be 22 points.
	[CCMenuItemFont setFontSize:22];
	
	// Reset Button
    __weak BBTestLoadableSceneLayer *weakself = self;
	CCMenuItemLabel *back = [CCMenuItemFont itemWithString:@"Go Back" block:^(id sender){
		[weakself.viewController.navigationController popViewControllerAnimated: YES];
	}];
		
	CCMenu *menu = [CCMenu menuWithItems: back, nil];
	
	[menu alignItemsVertically];
	
	CGSize size = [[CCDirector sharedDirector] winSize];
	[menu setPosition:ccp( size.width/2, size.height/2)];
	
	
	[self addChild: menu z:-1];
}



@end
