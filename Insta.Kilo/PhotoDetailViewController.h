//
//  PhotoDetailViewController.h
//  Insta.Kilo
//
//  Created by Shahin on 2015-03-29.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface PhotoDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *photoDetail;
@property (weak, nonatomic) IBOutlet UILabel *titleDetail;
@property (weak, nonatomic) IBOutlet UILabel *subjectDetail;
@property (weak, nonatomic) IBOutlet UILabel *locationDetail;
@property (strong, nonatomic) Photo *photo;

- (void)setDetailItem:(Photo *)photo;

@end
