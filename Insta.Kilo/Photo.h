//
//  Photo.h
//  InstaKilo
//
//  Created by Shahin on 2015-03-26.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *location;

- (instancetype)initWithTitle:(NSString *)title subject:(NSString *)subject location:(NSString *)location;

@end
