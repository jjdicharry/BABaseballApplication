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

- (IBAction)showDirections:(id)sender;

@end
