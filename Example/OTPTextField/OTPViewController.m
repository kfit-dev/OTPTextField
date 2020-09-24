//
//  OTPViewController.m
//  OTPTextField
//
//  Created by Berdikhan on 11/22/2018.
//  Copyright (c) 2018 Berdikhan. All rights reserved.
//

#import "OTPViewController.h"
#import <OTPTextField/OTPTextField.h>

@interface OTPViewController ()
@property (weak, nonatomic) IBOutlet OTPTextField *otpTextField;

@end

@implementation OTPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_otpTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
