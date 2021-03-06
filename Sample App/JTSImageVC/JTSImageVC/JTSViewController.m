//
//  JTSViewController.m
//  JTSImageVC
//
//  Created by Jared on 3/29/14.
//  Copyright (c) 2014 Nice Boy, LLC. All rights reserved.
//

#import "JTSViewController.h"

#import "JTSImageViewControllerObj.h"
#import "JTSImageInfo.h"

#define TRY_AN_ANIMATED_GIF 0

@interface JTSViewController ()

@end

@implementation JTSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapRecognizer addTarget:self action:@selector(bigButtonTapped:)];
    [self.bigImageButton addGestureRecognizer:tapRecognizer];
    [self.bigImageButton setAccessibilityLabel:@"Photo of a cat wearing a Bane costume."];
    self.bigImageButton.layer.cornerRadius = self.bigImageButton.bounds.size.width/2.0f;
}

- (void)bigButtonTapped:(id)sender {
    
    // Create image info
    JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
    imageInfo.image = [UIImage imageNamed:@"xkcd.jpeg"];
    imageInfo.referenceRect = self.bigImageButton.frame;
    imageInfo.referenceView = self.bigImageButton.superview;
    imageInfo.referenceContentMode = self.bigImageButton.contentMode;
    imageInfo.referenceCornerRadius = self.bigImageButton.layer.cornerRadius;
    
    // Setup view controller
    JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
                                           initWithImageInfo:imageInfo
                                           mode:JTSImageViewControllerMode_Image
                                           backgroundStyle:JTSImageViewControllerBackgroundOption_Blurred];
    
    // Present the view controller.
    [imageViewer showFromViewController:self transition:JTSImageViewControllerTransition_FromOriginalPosition];
}

@end





