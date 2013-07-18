//
//  BBGameSceneLoader.m
//  BocceBeers-iOS
//
//  Created by Stephen O'Connor on 6/13/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//

#import "BBGameSceneLoader.h"
#import "BBTestLoadableScene.h"

@implementation BBGameSceneLoader
{
    int _percentFinished;
    CCLabelTTF *_loadBar;

}

- (void)initLoadingScene
{
    _loadBar = [CCLabelTTF labelWithString:@"Loading Scene..."
                                  fontName:@"Helvetica-Bold"
                                  fontSize:18
                                dimensions:CGSizeMake(200, 24)
                                hAlignment:kCCTextAlignmentCenter
                                vAlignment:kCCVerticalTextAlignmentCenter];
    
    CGSize size = [[CCDirector sharedDirector] winSize];
	[_loadBar setPosition:ccp( size.width/2, size.height/2)];
    [self addChild:_loadBar];
    
    _percentFinished = 0;

    
    self.loadableSceneClass = [BBTestLoadableScene class];
}


@end
