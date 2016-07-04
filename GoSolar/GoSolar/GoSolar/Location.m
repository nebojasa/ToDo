//
//  Location.m
//  GoSolar
//
//  Created by Nebojsa Gujanicic on 01/07/2016.
//  Copyright © 2016 Nebojsa Gujanicic. All rights reserved.
//

#import "Location.h"

@implementation Location

#pragma mark - Designated Initializer

- (instancetype)initWithName:(NSString *)name andCoordinates:(CLLocationCoordinate2D)coordinates {
    if (self = [super init]) {
        self.name = name;
        self.coordinates = coordinates;
    }
    
    return self;
}

#pragma mark - MKAnnotationProtocol

- (NSString *)title {
    return self.name;
}

- (CLLocationCoordinate2D)coordinate {
    return self.coordinates;
}

@end
