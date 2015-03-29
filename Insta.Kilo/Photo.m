//
//  Photo.m
//  InstaKilo
//
//  Created by Shahin on 2015-03-26.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithTitle:(NSString *)title subject:(NSString *)subject location:(NSString *)location
{
    self = [super init];
    if (self) {
        self.title =title;
        self.subject = subject;
        self.location = location;
    }
    return self;
}


@end
