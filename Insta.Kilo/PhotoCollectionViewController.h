//
//  PhotoCollectionViewController.h
//  Insta.Kilo
//
//  Created by Shahin on 2015-03-27.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import "PhotoCollectionViewCell.h"
#import "PhotosSupplementaryView.h"
#import "PhotoDetailViewController.h"

@interface PhotoCollectionViewController : UICollectionViewController

@property (strong, nonatomic) Photo *photo;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) PhotosSupplementaryView *headerView;
@property (strong, nonatomic) PhotoDetailViewController *detailView;

@end
