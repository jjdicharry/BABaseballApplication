//
//  ViewController.m
//  BABaseballApplication
//
//  Created by Mac on 9/26/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "ViewController.h"
#import "BAJSONParser.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 *  Method - viewDidLoad
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BAJSONParser *jsonParser = [[BAJSONParser alloc] init];
    [jsonParser parseJSON:@"2015" andMonth:@"09" andDay:@"26"];
}

/**
 *  Method - didReceiveMemoryWarning
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
