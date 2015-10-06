//
//  BAMapViewController.m
//  BABaseballApplication
//
//  Created by Mac on 10/6/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "BAMapViewController.h"

@interface BAMapViewController ()

@end

@implementation BAMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *address = self.textAddress.text;
    
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
        
        [self.map addAnnotation:point];
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
}
@end
