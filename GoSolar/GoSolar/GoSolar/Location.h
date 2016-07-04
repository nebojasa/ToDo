//
//  Location.h
//  GoSolar
//
//  Created by Nebojsa Gujanicic on 01/07/2016.
//  Copyright © 2016 Nebojsa Gujanicic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface Location : NSObject
@property (strong, nonatomic) NSString *name;
@property (nonatomic) CLLocationCoordinate2D coordinates;

- (instancetype)initWithName:(NSString *)name andCoordinates:(CLLocationCoordinate2D)coordinates;
@end
