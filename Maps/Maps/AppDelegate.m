//
//  AppDelegate.m
//  Maps
//
//  Created by Djuro Alfirevic on 4/27/16.
//  Copyright © 2016 Djuro Alfirevic. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate() <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLGeocoder *geocoder;
@end

@implementation AppDelegate

#pragma mark - Private API
    //integracija GPSa
- (void)configureGPS {
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;// setovanje delegata
        self.locationManager.distanceFilter = 10.0f;//okida nakon 10m
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;//turnbyturn
        [self.locationManager requestWhenInUseAuthorization];//radi u begroundu
        [self.locationManager startUpdatingLocation];//
    }
}
    //konfigurisanje geokodera
- (void)configureGeocoder {
    self.geocoder = [[CLGeocoder alloc] init];
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureGPS];//poziva metodu cim se pokrene app
    [self configureGeocoder];
    
    return YES;
}

#pragma mark - CLLocationManagerDelegate
    //GPS error objekat
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"GPS error: %@", [error localizedDescription]);//izbacuje opis zasto gps nije uspeo sa se startuje
}
    //metoda koja dobijia niz lokacija
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (locations.count > 0) {
        CLLocation *location = [locations firstObject];//daje prvi objekat u location nizu
        NSLog(@"Latitude: %.2f, longitude: %.2f", location.coordinate.latitude, location.coordinate.longitude);
        //metoda vraca dodatne informacije sa lokacije
        [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> *placemarks, NSError *error) {
            if (error) {
                NSLog(@"%@", [error localizedDescription]);
            }
            
            CLPlacemark *placemark = [placemarks firstObject];//moze i lastObject
            NSLog(@"Name: %@", placemark.name);
            NSLog(@"Country: %@", placemark.country);
            NSLog(@"Postal Code: %@", placemark.postalCode);
            NSLog(@"Administrative area: %@", placemark.administrativeArea);
            NSLog(@"Subadministrative area: %@", placemark.subAdministrativeArea);
            NSLog(@"Locality: %@", placemark.locality);
            NSLog(@"Ocean: %@", placemark.ocean);
        }];
    }
}

@end