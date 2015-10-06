//
//  BAMediaViewController.m
//  BABaseballApplication
//
//  Created by Mac on 10/5/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "BAMediaViewController.h"

@interface BAMediaViewController ()

@end

@implementation BAMediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL        *url        = [NSURL URLWithString:self.mediaURLString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
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

- (IBAction)share:(id)sender {
    NSArray *stuffToPost;
    stuffToPost = @[self.mediaURLString];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:stuffToPost applicationActivities:nil];
    [self presentViewController:activityViewController animated:YES completion:nil];
}
@end
