Cocos2D - UIKit Hybrid Boilerplate Project
==========================================

I wanted to rapidly build a game, and leverage the power of UIKit for the menu system and Interface Builder, meanwhile wanting to use Cocos2D for the gameplay and fast rendering.  

I wanted to make it easy to asynchronously load game scenes, and take a lot of the nitty-gritty away from the programmer.

This demo is therefore showing the barebones of this system, where you can use UIKit for your game's menu system, etc. and use Cocos2D for the gameplay part.


Installing the Demo
-------------------

* download/clone this project
* make sure you have cocoapods installed www.cocoapods.org
* from a Terminal in this project's root folder, run  pod install
* now open the workspace project and build.
* run the app


Using this in your own projects
-------------------------------

* install cocos2D via CocoaPods
* Import the Cocos2DViewController and Cocos2DLoadableScene folders into your project
* Would make sense to put cocos2d.h and CCNode+BocceBeers.h in your .pch file

Hopefully this demo project will show you what you need to know to get up and running.
