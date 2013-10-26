//
//  PCBoard.m
//  CocoaChess
//
//  Created by Michael Zornek on 10/26/13.
//  Copyright (c) 2013 Michael Zornek. All rights reserved.
//

#import "PCBoard.h"
#import "PCPiece.h"

@interface PCBoard ()

@property (strong) NSMutableDictionary *spaces;

@end

@implementation PCBoard

- (id)init
{
    self = [super init];
    if (self) {
        [self initalizeSpaces];
    }
    return self;
}

- (NSString *)positionForRow:(NSUInteger)row column:(NSUInteger)column {
    NSArray *letters = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h"];
    NSArray *numbers = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    NSString *positionString = [NSString stringWithFormat:@"%@%@", [letters objectAtIndex:column], [numbers objectAtIndex:row]];
    return positionString;
}

- (PCPiece *)pieceAtRow:(NSUInteger)row column:(NSUInteger)column {
    NSString *positionString = [self positionForRow:row column:column];
    id result = [self.spaces objectForKey:positionString];
    if (result == [NSNull null]) {
        result = nil;
    }
    return result;
}

- (void)initalizeSpaces
{
//    NSArray *letters =
//    NSArray *numbers = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    self.spaces = [[NSMutableDictionary alloc] init];
//    for (NSString *letter in letters) {
//        for (NSString *number in numbers) {
//            NSString *key = [NSString stringWithFormat:@"%@%@",letter,number];
//            [self.spaces setObject:[NSNull null] forKey:key];
//        }
//    }
//    
    NSString *pathToCleanBoard = [[NSBundle mainBundle] pathForResource:@"clean_board" ofType:@"json"];
    NSData *cleanBoardData = [NSData dataWithContentsOfFile:pathToCleanBoard];
    NSDictionary *cleanBoard = [NSJSONSerialization JSONObjectWithData:cleanBoardData options:0 error:nil];
    NSDictionary *board = [cleanBoard objectForKey:@"board"];
    for (NSString *boardPosition in board) {
        id pieceAttributes = [board valueForKey:boardPosition];
        
        if ([NSNull null] == pieceAttributes) {
            [self.spaces setObject:[NSNull null] forKey:boardPosition];
        } else {
            PCPiece *newPiece = [[PCPiece alloc] init];
            
            NSString *colorValue = [pieceAttributes valueForKey:@"color"];
            newPiece.color = (PCPieceColor)[[[PCBoard colorMapping] objectForKey:colorValue] unsignedIntegerValue];
            
            NSString *typeValue = [pieceAttributes valueForKey:@"type"];
            newPiece.type = (PCPieceType)[[[PCBoard typeMapping] objectForKey:typeValue] unsignedIntegerValue];
            
            [self.spaces setObject:newPiece forKey:boardPosition];
        }
        
    }
    
    NSLog(@"clean board %@", self.spaces);
}

+ (NSDictionary *)typeMapping
{
    return @{@"pawn" : @(PCPieceTypePawn),
             @"king" : @(PCPieceTypeKing),
             @"queen" : @(PCPieceTypeQueen),
             @"bishop" : @(PCPieceTypeBishop),
             @"knight" : @(PCPieceTypeKnight),
             @"rook" : @(PCPieceTypeRook)};
}

+ (NSDictionary *)colorMapping
{
    return @{@"white" : @(PCPieceColorWhite),
             @"black" : @(PCPieceColorBlack)};
}

+ (PCPieceColor)pieceColorForJSONValue:(NSString *)value
{
    if ([value isEqualToString:@"white"]) {
        return PCPieceColorWhite;
    } else {
        return PCPieceColorBlack;
    }
}

+ (PCPieceType)pieceTypeForJSONValue:(NSString *)value
{
    if ([value isEqualToString:@"white"]) {
        return PCPieceColorWhite;
    } else {
        return PCPieceColorBlack;
    }
}



@end
