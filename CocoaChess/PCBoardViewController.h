//
//  PCBoardViewController.h
//  CocoaChess
//
//  Created by Joe on 10/26/13.
//  Copyright (c) 2013 Michael Zornek. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PCBoard;
@interface PCBoardViewController : UICollectionViewController

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) PCBoard *board;
@end
