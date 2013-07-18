/*
 *  LoadingScene.m
 *  Bocce Beers
 *
 *  Created by Stephen O'Connor 
 */

#import <Foundation/Foundation.h>
#import "BBLoadableSceneProtocol.h"

@interface BBSceneLoader : BBScene
{
    @protected
    CCScene *_loadedScene;
}
// i.e. if you want to make sure your loading screen is displayed for a minimum amount of time (for example if displaying information to the user)
@property (nonatomic, assign) NSTimeInterval minimumLoadingTime;

@property (nonatomic, strong) Class<BBLoadableSceneProtocol> loadableSceneClass;

// this is what your subclasses should override, NOT the init method.  This is where you set up the scene that displays while your loadableScene is loading.
- (void)initLoadingScene;

// if your loading scene keeps a reference to this scene loader, it can call updateProgress with some object.
// typically you'd want to define some dictionary keys and objects and pass those.

- (void)updateProgress:(id)userInfo; // so your loading scenes can call this on the main queue if you need to update

@end