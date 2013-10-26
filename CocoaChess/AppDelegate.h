//
//  AppDelegate.h
//  CocoaChess
//
//  Created by Michael Zornek on 10/26/13.
//  Copyright (c) 2013 Michael Zornek. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PCBoardViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PCBoardViewController *boardVC;
@end
