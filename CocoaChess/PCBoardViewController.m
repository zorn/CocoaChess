//
//  PCBoardViewController.m
//  CocoaChess
//
//  Created by Joe on 10/26/13.
//  Copyright (c) 2013 Michael Zornek. All rights reserved.
//

#import "PCBoardViewController.h"
#import "PCBoardCell.h"
#import "PCBoard.h"
#import "PCPiece.h"

static NSString *kPCBoardCellIdentifier = @"com.cocoachess.pcboardcell";

@interface PCBoardViewController ()

@end

@implementation PCBoardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
    self.view = self.collectionView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor orangeColor];
    [self.collectionView registerClass:[PCBoardCell class]  forCellWithReuseIdentifier:kPCBoardCellIdentifier];
    CGFloat fullWidth = self.collectionView.bounds.size.width;
    CGFloat itemDimension = fullWidth/8.;
    self.flowLayout.itemSize = CGSizeMake(itemDimension, itemDimension);
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 0;
    [self.flowLayout invalidateLayout];
    
    PCBoard *board = [[PCBoard alloc] init];
    self.board = board;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBoard:(PCBoard *)board
{
    if (board != _board) {
        _board = board;
        [self.collectionView reloadData];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 64;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PCBoardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPCBoardCellIdentifier forIndexPath:indexPath];
    NSUInteger row = indexPath.row / 8;
    NSUInteger column = indexPath.row % 8;
    BOOL isEvenRow = row % 2 == 0;
    BOOL isEvenColumn = column % 2 == 0;
    UIColor *backgroundColor = isEvenColumn ? isEvenRow ? [UIColor lightGrayColor] : [UIColor darkGrayColor] : isEvenRow ? [UIColor darkGrayColor] : [UIColor lightGrayColor];

//    cell.label.text = [NSString stringWithFormat:@"%lu %lu", (unsigned long)row, (unsigned long)column];
    cell.backgroundColor = backgroundColor;

    cell.label.textAlignment = NSTextAlignmentCenter;
    PCPiece *piece = [self.board pieceAtRow:row column:column];
    UIColor *textColor = piece.isWhite ? [UIColor whiteColor] : [UIColor blackColor];
    cell.label.textColor = textColor;
    cell.label.font = [UIFont systemFontOfSize:30];
    NSString *pieceString = [piece unicodeHackRepresentation];
    cell.label.text = pieceString;
    return cell;
}

@end
