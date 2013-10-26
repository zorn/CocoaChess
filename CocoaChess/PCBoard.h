//
//  PCBoard.h
//  CocoaChess
//
//  Created by Michael Zornek on 10/26/13.
//  Copyright (c) 2013 Michael Zornek. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PCPiece;
@interface PCBoard : NSObject

- (PCPiece *)pieceAtRow:(NSUInteger)row column:(NSUInteger)column;

@end
