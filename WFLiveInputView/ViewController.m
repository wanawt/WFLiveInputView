//
//  ViewController.m
//  WFLiveInputView
//
//  Created by 巩姝慧 on 2016/11/12.
//  Copyright © 2016年 menlian. All rights reserved.
//

#import "ViewController.h"
#import "WFLiveTextField.h"

@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UITextField *textView;
@property (nonatomic, retain) WFLiveTextField *liveField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _liveField = [[WFLiveTextField alloc] initWithFrame:CGRectMake(40, 100, 200, 40)];
    _liveField.placehoderString = @"Phone";
    [self.view addSubview:_liveField];
//    [self liveInputView];
}

- (void)liveInputView {
    _label = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, 200, 40)];
    _label.textColor = [UIColor blackColor];
    _label.text = @"Email";
    _label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_label];
    
    _textView = [[UITextField alloc] initWithFrame:CGRectMake(40, 100, 200, 40)];
    _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textView.layer.borderWidth = 0.5;
    _textView.delegate = self;
    [self.view addSubview:_textView];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.3 animations:^{
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(0.6, 0.6);
        CGAffineTransform t = CGAffineTransformTranslate(scaleTransform, -200*0.6/2, -40*0.6/2-35);
        _label.transform = t;
    }];
    return YES;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [UIView animateWithDuration:0.3 animations:^{
//        _label.transform = CGAffineTransformIdentity;
//    }];
//    [_textView resignFirstResponder];
    [_liveField loseFocus];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
