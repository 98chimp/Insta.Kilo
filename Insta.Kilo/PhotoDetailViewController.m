//
//  PhotoDetailViewController.m
//  Insta.Kilo
//
//  Created by Shahin on 2015-03-29.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "PhotoDetailViewController.h"

@interface PhotoDetailViewController ()

@property (strong, nonatomic) IBOutlet UIButton *doneButton;

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetailItem:(Photo *)photo {
    if (_photo != photo) {
        _photo = photo;
        
        [self configureView];
    }
}

- (void)configureView {
    if (self.photo) {
        self.photoDetail.image = [UIImage imageNamed: self.photo.title];
        self.titleDetail.text = self.photo.title;
        self.subjectDetail.text = self.photo.subject;
        self.locationDetail.text = self.photo.location;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

@end
