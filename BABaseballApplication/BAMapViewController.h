//
//  BAMapViewController.h
//  BABaseballApplication
//
//  Created by Mac on 10/6/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface BAMapViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *directionsButton;
@property (weak, nonatomic) NSString *stadium;
@property (weak, nonatomic) NSString *street;
@property (weak, nonatomic) NSString *city;
@property (weak, nonatomic) NSString *state;
@property (weak, nonatomic) NSString *ZIPCode;
@property (weak, nonatomic) NSString *phone;

- (IBAction)showDirections:(id)sender;

@end
