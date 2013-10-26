//
//  PCGame.h
//  CocoaChess
//
//  Created by Michael Zornek on 10/26/13.
//  Copyright (c) 2013 Michael Zornek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PCPlayer;

@interface PCGame : NSObject

@property (strong) PCPlayer *playerOne;
@property (strong) PCPlayer *playerTwo;

@end
