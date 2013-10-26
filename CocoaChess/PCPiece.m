//
//  PCPiece.m
//  CocoaChess
//
//  Created by Michael Zornek on 10/26/13.
//  Copyright (c) 2013 Michael Zornek. All rights reserved.
//

#import "PCPiece.h"

@implementation PCPiece

- (id)initWithType:(PCPieceType)type ofColor:(PCPieceColor)color
{
    self = [super init];
    if (self) {
        self.type = type;
        self.color = color;
    }
    return self;
}

- (NSString *)unicodeHackRepresentation {
    switch (self.type) {
        case PCPieceTypePawn:
            return self.isWhite ? @"♙" : @"♟";
            break;
        case PCPieceTypeRook:
            return self.isWhite ? @"♖" : @"♜";
            break;
        case PCPieceTypeBishop:
            return self.isWhite ? @"♗" : @"♝";
            break;
        case PCPieceTypeKnight:
            return self.isWhite ? @"♘" : @"♞";
            break;
        case PCPieceTypeQueen:
            return self.isWhite ? @"♕" : @"♛";
            break;
        case PCPieceTypeKing:
            return self.isWhite ? @"♔" : @"♚";
            break;
        default:
            break;
    }
    return  nil;
}

- (id)init
{
    return [self initWithType:PCPieceTypePawn ofColor:PCPieceColorWhite];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@, t:%lu, c:%lu", [super description], (unsigned long)self.type, (unsigned long)self.color];
}

- (BOOL)isBlack
{
    return (PCPieceColorBlack == self.color);
}

- (BOOL)isWhite
{
    return (PCPieceColorWhite == self.color);
}

@end
