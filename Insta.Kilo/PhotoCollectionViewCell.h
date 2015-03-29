//
//  PhotoCollectionViewCell.h
//  InstaKilo
//
//  Created by Shahin on 2015-03-26.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *photoCellImageView;
@property (strong, nonatomic) NSString *subject;

@end
