//
//  BAMapViewController.m
//  BABaseballApplication
//
//  Created by Mac on 10/6/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "BAMapViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface BAMapViewController ()

@end

@implementation BAMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *address;
    self.teamLogo.image     = [UIImage imageNamed:self.teamAbbr];
    self.stadiumLabel.text  = self.stadium;
    self.address1Label.text = self.street;
    self.address1Label.text = [self.address1Label.text stringByAppendingString:@", "];
    self.address1Label.text = [self.address1Label.text stringByAppendingString:self.city];
    self.address2Label.text = self.state;
    self.address2Label.text = [self.address2Label.text stringByAppendingString:@", "];
    self.address2Label.text = [self.address2Label.text stringByAppendingString:self.ZIPCode];
    self.address2Label.text = [self.address2Label.text stringByAppendingString:@"  P: "];
    self.address2Label.text = [self.address2Label.text stringByAppendingString:self.phone];
    
    address = self.street;
    address = [address stringByAppendingString:@", "];
    address = [address stringByAppendingString:self.city];
    address = [address stringByAppendingString:@", "];
    address = [address stringByAppendingString:self.state];
    address = [address stringByAppendingString:@", "];
    address = [address stringByAppendingString:self.ZIPCode];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        
        MKCoordinateRegion region;
        region.center.latitude  = ((CLCircularRegion*)placemark.region).center.latitude;
        region.center.longitude = ((CLCircularRegion*)placemark.region).center.longitude;
        
        MKCoordinateSpan span;
        double radius = ((CLCircularRegion*)placemark.region).radius / 200;
        span.latitudeDelta = radius / 112.0;
        region.span = span;
        
        [self.mapView setRegion:region animated:YES];
        
        MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        point.coordinate = region.center;
        
        point.title = @"Your Address";
        point.subtitle = [NSString stringWithFormat:@"LatLon: %f %f", point.coordinate.latitude, point.coordinate.longitude];
        
        [self.mapView addAnnotation:point];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showDirections:(id)sender {
    CLGeocoder *geocoder      = [[CLGeocoder alloc] init];
    NSString   *addressString = [NSString stringWithFormat:@"%@ %@ %@ %@", self.street, self.city,
                                 self.state, self.ZIPCode];
    
    [geocoder geocodeAddressString:addressString completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"Geocode failed with error: %@", error.localizedDescription);
            return;
        }
        
        if (placemarks && placemarks.count > 0) {
            CLPlacemark *placemark = placemarks[0];
            CLLocation *location = placemark.location;
            self.coordinate = location.coordinate;
            [self showMap];
        }
        
    }];
}

-(void)showMap {
    NSDictionary *address = @{(NSString *)kABPersonAddressStreetKey:self.street,(NSString *)kABPersonAddressCityKey:self.city,(NSString *)kABPersonAddressStateKey:self.state,(NSString *)kABPersonAddressZIPKey:self.ZIPCode};
    
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:self.coordinate addressDictionary:address];
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving};
    [mapItem openInMapsWithLaunchOptions:options];
}

@end
