//
//  OTPTextField.h
//  OTPTextField
//
//  Created by Berdikhan on 02/11/2018.
//  Copyright © 2018 Berdikhan Satenov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OTPTextField;

@protocol OTPTextFieldDelegate <NSObject>

- (void)otpTextField:(OTPTextField* _Nonnull)textField didChange:(NSString* _Nonnull)otpCode;

@end

IB_DESIGNABLE

@interface OTPTextField : UITextField

/*
    @abstract Placeholder separator. Default '-'.
 */
@property (nonatomic) IBInspectable NSString * _Nonnull placeholderSeparator;

/*
    @abstract Placeholder color. Default gray.
 */
@property (nonatomic) IBInspectable UIColor * _Nonnull placeholderColor;

/*
    @abstract Letter spacing. Default 30.
 */
@property (nonatomic) IBInspectable CGFloat spacing;

/*
    @abstract Length of code. Default 4.
 */
@property (nonatomic) IBInspectable int count;


@property (nonatomic, weak, nullable) id<OTPTextFieldDelegate> otpDelegate;

@end
