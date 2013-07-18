//
//  BBCocos2DViewController.h
//  BocceBeers-iOS
//
//  Created by Stephen O'Connor on 6/2/13.
//  Copyright (c) 2013 Stephen O'Connor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBViewController.h"

@interface BBCocos2DViewController : BBViewController<CCDirectorDelegate>
{
    @protected
    __weak CCDirectorIOS *_director;
}
@end
