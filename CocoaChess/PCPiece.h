//
//  PCPiece.h
//  CocoaChess
//
//  Created by Michael Zornek on 10/26/13.
//  Copyright (c) 2013 Michael Zornek. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    PCPieceTypeKing = 0,
    PCPieceTypeQueen = 1,
    PCPieceTypeBishop = 2,
    PCPieceTypeKnight = 3,
    PCPieceTypeRook = 4,
    PCPieceTypePawn = 5
};
typedef NSUInteger PCPieceType;

enum {
    PCPieceColorWhite = 0,
    PCPieceColorBlack = 1
};
typedef NSUInteger PCPieceColor;

@interface PCPiece : NSObject

@property (assign) PCPieceType type;
@property (assign) PCPieceColor color;

@property (readonly) BOOL isWhite;
@property (readonly) BOOL isBlack;

@property (nonatomic, readonly) NSString *unicodeHackRepresentation;

- (id)initWithType:(PCPieceType)type ofColor:(PCPieceColor)color;

@end
