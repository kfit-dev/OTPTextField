//
//  OTPTextField.m
//  OTPTextField
//
//  Created by Berdikhan on 02/11/2018.
//  Copyright © 2018 Berdikhan Satenov. All rights reserved.
//

#import "OTPTextField.h"

@interface OTPTextField () <UITextFieldDelegate>

@end

@implementation OTPTextField {
    UILabel* placeholderLabel;
    UIColor* __textColor;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self customInit];
        [self setup];
    }
    return self;
}

- (void)prepareForInterfaceBuilder {
    [self setup];
}

- (void)setNeedsLayout {
    [super setNeedsLayout];
    [self setNeedsDisplay];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    placeholderLabel.frame = self.bounds;
    [self updateText];
}

- (void)customInit {
    self.delegate = self;
    self.placeholderSeparator = @"-";
    self.placeholderColor = [UIColor grayColor];
    self.spacing = 30.0;
    __textColor = [UIColor blackColor];
    self.keyboardType = UIKeyboardTypeNumberPad;
    self.textAlignment = NSTextAlignmentCenter;
    if (@available(iOS 12.0, *)) {
        self.textContentType = UITextContentTypeOneTimeCode;
    }
    self.count = 4;
    self.placeholder = @"";
    self.tintColor = [UIColor clearColor];
    [self addPlaceholder];
    UIColor *tempColor = self.textColor;
    self.textColor = [UIColor clearColor];
    __textColor = tempColor;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textEditingChanged)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self];
    
}

- (void)textEditingChanged {
    if ([self.otpDelegate respondsToSelector:@selector(otpTextField:didChange:)]) {
        [self.otpDelegate otpTextField:self didChange:self.text];
    }
    [self updateText];
}

- (void)setTextColor:(UIColor *)textColor {
    __textColor = textColor;
    [super setTextColor:[UIColor clearColor]];
    [self updateText];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    [self updateText];
}

- (void)setTintColor:(UIColor *)tintColor {
    [super setTintColor:[UIColor clearColor]];
}

- (void)setPlaceholder:(NSString *)placeholder {
    [super setPlaceholder:@""];
}

- (void)setup {
    [placeholderLabel setFrame:self.bounds];
    [self updateText];
}

- (void)updateText {
    if (_count < 1) {
        return;
    }
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    [style setAlignment:self.textAlignment];
    NSDictionary *defaultAttributes = @{NSFontAttributeName: self.font,
                                        NSParagraphStyleAttributeName: style};
    NSDictionary *spacingAttributes = @{NSKernAttributeName: [NSNumber numberWithInt:_spacing]};
    
    NSDictionary *textAttributes = @{NSForegroundColorAttributeName: __textColor};
    NSDictionary *placeholderAttributes = @{NSForegroundColorAttributeName: _placeholderColor};
    
    NSMutableAttributedString *formattedText = [NSMutableAttributedString new];
    
    [formattedText appendAttributedString:[[NSAttributedString alloc] initWithString:self.text
                                                                          attributes:textAttributes]];
    NSMutableArray *placeholderArray = [NSMutableArray new];
    for (int i=0; i<(_count - self.text.length); i++) {
        [placeholderArray addObject:_placeholderSeparator];
    }
    [formattedText appendAttributedString:[[NSAttributedString alloc] initWithString:[placeholderArray componentsJoinedByString:@""]
                                                                          attributes:placeholderAttributes]];
    [formattedText addAttributes:defaultAttributes range:NSMakeRange(0, _count)];
    if (_count > 1) {
        [formattedText addAttributes:spacingAttributes range:NSMakeRange(0, _count-1)];
    }
    placeholderLabel.attributedText = formattedText;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.text.length < self.count) {
        return true;
    }
    if (string.length == 0) {
        return true;
    }
    return false;
}

- (void)addPlaceholder {
    if (placeholderLabel == nil) {
        placeholderLabel = [UILabel new];
        [self.layer addSublayer:placeholderLabel.layer];
    }
}

#pragma mark - dealloc
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
