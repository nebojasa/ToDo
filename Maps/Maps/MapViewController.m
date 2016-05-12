//
//  MapViewController.m
//  Maps
//
//  Created by Djuro Alfirevic on 4/27/16.
//  Copyright © 2016 Djuro Alfirevic. All rights reserved.
//

#import "MapViewController.h"

#define kRegionRadius 5000

@interface MapViewController() <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation MapViewController

#pragma mark - Actions

- (IBAction)cancelButtonTapped {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Private API
    //Metoda koja zumira mapu na odgovarajucu koordinatu
- (void)zoomMapToCoordinate:(CLLocationCoordinate2D)coordinate {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, kRegionRadius * 2.0, kRegionRadius * 2.0);//kreira region
    MKCoordinateRegion coordinateRegion = [self.mapView regionThatFits:region];//kreira coordinateRegion koji tacno upada u region
    [self.mapView setRegion:coordinateRegion animated:YES];//setovanje mapView na coordinateRegion animirano
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.location) {
            [self.mapView addAnnotation:self.location];
        }
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self zoomMapToCoordinate:self.location.coordinates];//zumiranje mape na koordinatu lokacije
    });
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
    if (pinView == nil) {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"];
    }
    
    pinView.canShowCallout = YES;//prikazivanje baloncica
    pinView.animatesDrop = YES;//animacija pada ciode ali samo za pin!
    pinView.pinTintColor = [UIColor colorWithRed:0.18 green:0.54 blue:0.49 alpha:1.0];//sredjivanje pina boje
    
    // UIButton
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];//info dugme
    button.frame = CGRectMake(0, 0, 40, 40);//definisanje frejma
    pinView.rightCalloutAccessoryView = button;
    
    return pinView;
}
    // Metoda koja omogucava da se klikne na dugme MapKitDelegate
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    NSLog(@"Tapped");
}

@end