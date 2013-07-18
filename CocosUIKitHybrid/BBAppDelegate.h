//
//  BBAppDelegate.h
//  CocosUIKitHybrid
//
//  Created by Stephen O'Connor on 7/18/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BBViewController;

@interface BBAppDelegate : UIResponder <UIApplicationDelegate>
{
    
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, weak) CCDirectorIOS *cocosDirector; // director is a singleton that we only set after first use

@end
