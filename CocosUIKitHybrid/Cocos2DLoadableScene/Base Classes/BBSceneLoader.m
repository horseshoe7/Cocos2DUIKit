/*
 *  LoadingScene.m
 *  Bocce Beers
 *
 *  Created by Stephen O'Connor
 *
 */

#import "BBSceneLoader.h"

static const NSTimeInterval kTransitionTime = 3.0f;

@implementation BBSceneLoader
{
    
    NSTimer *_minimumWaitTimer;
    BOOL _waitFinished;
    BOOL _loadingFinished;
}


- (id)init {
    
	self = [super init];
    if (self) {

        _waitFinished  = NO;
        _loadingFinished = NO;
        _minimumLoadingTime = 1.5f;

        [self initLoadingScene];
    }	
	return self;
}

#pragma mark - Custom Overrides

- (void)initLoadingScene
{
    
}

- (void)updateProgress:(id)userInfo
{
    /* here you put code for how to display changes in progress.  Make sure your calling class
        calls this method (probably in its initScene method) with:
     
     dispatch_async(dispatch_get_main_queue(), ^{
     
        [[weakself sceneLoader] updateProgress: someDictionaryProbably];
     });
     */
    
    
}

- (void)onEnterTransitionDidFinish
{
	NSLog(@"Loading Scene:  Starting wait.");
    
    // we should use this method to start loading the next scene in the background, and when
    // it reports as being finished, just then tells the director to change.
    [NSTimer scheduledTimerWithTimeInterval: _minimumLoadingTime
                                     target: self
                                   selector: @selector(waitFinished)
                                   userInfo: nil
                                    repeats: NO];
    
    NSAssert(self.loadableSceneClass != Nil, @"Should have set a class for the scene loader!");
    
    __weak BBSceneLoader *weakself = self;
    
    // should do this on another thread
    dispatch_queue_t _queue = dispatch_queue_create("com.horseshoe7.boccebeers.sceneloader.queue", 0);
    dispatch_async(_queue, ^{
        
        BBScene<BBLoadableSceneProtocol> *loadableScene = nil;
       
        // The following code was taken and modified from the cocos2D forum
        // http://www.cocos2d-iphone.org/forum/topic/2242#post-29174
        
        @autoreleasepool {
            
            EAGLContext *k_context = [[EAGLContext alloc] initWithAPI: kEAGLRenderingAPIOpenGLES2
                                                           sharegroup: [[(CCGLView*)[[CCDirector sharedDirector] view] context] sharegroup]];
            [EAGLContext setCurrentContext:k_context];
            
            // instantiate your loadable scene here.  In this example we use a Cocos2DViewController, a subclass of UIViewController,
            // so I make sure the scene object can talk to its UIViewController
            loadableScene = (BBScene<BBLoadableSceneProtocol> *)[weakself.loadableSceneClass sceneWithViewController: weakself.viewController];

            if ([loadableScene respondsToSelector:@selector(setSceneLoader:)]) {
                [loadableScene setSceneLoader: self];
            }
            
            [loadableScene initScene];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [weakself loadingFinished: loadableScene];
        });
    });
}

- (void)waitFinished
{
    _waitFinished = YES;
    if (!_waitFinished || !_loadingFinished) {
        return;
    }
    
    [self transitionToLoadedScene];
    _loadedScene = nil;

}

- (void)loadingFinished:(CCScene*)loadedScene
{
    if ([loadedScene respondsToSelector:@selector(loadObjectsOnMainThread)]) {
        [(id<BBLoadableSceneProtocol>)loadedScene loadObjectsOnMainThread];
    }
    
    _loadingFinished = YES;
    _loadedScene = loadedScene;
    
    if (!_waitFinished || !_loadingFinished) {
        return;
    }
    
    [self transitionToLoadedScene];
    _loadedScene = nil;

}

- (void)transitionToLoadedScene
{
    NSAssert(_loadedScene != nil, @"You tried to transition to a loaded scene that was never loaded!");
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration: kTransitionTime scene: _loadedScene]];
}

@end
