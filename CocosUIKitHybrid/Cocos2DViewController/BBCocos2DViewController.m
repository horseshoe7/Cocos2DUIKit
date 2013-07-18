//
//  BBCocos2DViewController.m
//  BocceBeers-iOS
//
//  Created by Stephen O'Connor on 6/2/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//

#import "BBCocos2DViewController.h"
#import "BBAppDelegate.h"

@interface BBCocos2DViewController ()

@end

@implementation BBCocos2DViewController

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

    [self setupCocos2D];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)setupCocos2D
{
    
    
    BBAppDelegate *appdelegate = (BBAppDelegate*)[[UIApplication sharedApplication] delegate];

    if (appdelegate.cocosDirector != nil)
    {
        // we've set up the director already
        _director = appdelegate.cocosDirector;
    }
    else
    {
        _director = (CCDirectorIOS*) [CCDirector sharedDirector];
        appdelegate.cocosDirector = _director;
        
        if (_director.view == nil) {
            
            //http://stackoverflow.com/questions/12168079/multiple-opengl-views-cocos2d
            // Cocos2D can only use one GLView, so we need to keep it for the lifetime of the app
            
            // Create an CCGLView with a RGB565 color buffer, and a depth buffer of 0-bits
            CCGLView *glView = [CCGLView viewWithFrame: self.view.bounds
                                           pixelFormat: kEAGLColorFormatRGB565 //kEAGLColorFormatRGB565	//kEAGLColorFormatRGBA8
                                           depthFormat: 0	//GL_DEPTH_COMPONENT24_OES
                                    preserveBackbuffer: NO
                                            sharegroup: [[EAGLSharegroup alloc] init]
                                         multiSampling: NO
                                       numberOfSamples: 0];
            
            glView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [glView setMultipleTouchEnabled:YES];
            [_director setView: glView];
        }
        
        _director.wantsFullScreenLayout = YES;
        
        NSLog(@"%@", NSStringFromCGSize(_director.winSize));
        
        // Display FSP and SPF
        [_director setDisplayStats:YES];
        
        // set FPS at 60
        [_director setAnimationInterval:1.0/60];
        // 2D projection
        [_director setProjection:kCCDirectorProjection2D];
        
        // Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
        if( ! [_director enableRetinaDisplay:NO] )
            CCLOG(@"Retina Display Not supported");
        
        // Default texture format for PNG/BMP/TIFF/JPEG/GIF images
        // It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
        // You can change anytime.
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
        
        // If the 1st suffix is not found and if fallback is enabled then fallback suffixes are going to searched. If none is found, it will try with the name without suffix.
        // On iPad HD  : "-ipadhd", "-ipad",  "-hd"
        // On iPad     : "-ipad", "-hd"
        // On iPhone HD: "-hd"
        CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
        [sharedFileUtils setEnableFallbackSuffixes:NO];				// Default: NO. No fallback suffixes are going to be used
        [sharedFileUtils setiPhoneRetinaDisplaySuffix:@"-hd"];		// Default on iPhone RetinaDisplay is "-hd"
        [sharedFileUtils setiPadSuffix:@"-ipad"];					// Default on iPad is "ipad"
        [sharedFileUtils setiPadRetinaDisplaySuffix:@"-ipadhd"];	// Default on iPad RetinaDisplay is "-ipadhd"
        
        // Assume that PVR images have premultiplied alpha
        [CCTexture2D PVRImagesHavePremultipliedAlpha:YES];
        
    }
    
    [self.view insertSubview: _director.view atIndex:0];
    
    NSLog(@"%@", NSStringFromCGSize(_director.winSize));
    
	// for rotation and other messages
	//[_director setDelegate:self];
	
	    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_director startAnimation];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_director stopAnimation];
}

@end
