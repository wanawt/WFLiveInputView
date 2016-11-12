//
//  WFLiveTextField.m
//  WFLiveInputView
//
//  Created by 巩姝慧 on 2016/11/12.
//  Copyright © 2016年 menlian. All rights reserved.
//

#import "WFLiveTextField.h"

@implementation WFLiveTextField {
    UILabel *_label;
    UITextField *_textView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self liveInputView];
    }
    return self;
}

- (void)liveInputView {
    _label = [[UILabel alloc] initWithFrame:self.bounds];
    _label.textColor = [UIColor blackColor];
    _label.text = _placehoderString;
    _label.font = [UIFont systemFontOfSize:16];
    [self addSubview:_label];
    
    _textView = [[UITextField alloc] initWithFrame:self.bounds];
    _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textView.layer.borderWidth = 0.5;
    _textView.delegate = self;
    [self addSubview:_textView];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.3 animations:^{
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(0.6, 0.6);
        CGAffineTransform t = CGAffineTransformTranslate(scaleTransform, -200*0.6/2, -40*0.6/2-35);
        _label.transform = t;
    }];
    return YES;
}

- (void)setPlacehoderString:(NSString *)placehoderString {
    _placehoderString = placehoderString;
    _label.text = _placehoderString;
}

- (void)loseFocus {
    if ([_textView isFirstResponder]) {
        [UIView animateWithDuration:0.3 animations:^{
            _label.transform = CGAffineTransformIdentity;
        }];
        [_textView resignFirstResponder];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
