//
//  ViewController.m
//  PolygonAttributeView
//
//  Created by 刘鹏i on 2018/12/18.
//  Copyright © 2018 wuhan.musjoy. All rights reserved.
//

#import "ViewController.h"
#import "PolygonAttributeView.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIStackView *view1;
@property (strong, nonatomic) IBOutlet UIStackView *view2;
@property (strong, nonatomic) IBOutlet UIStackView *view3;
@property (strong, nonatomic) IBOutlet UIStackView *view4;
@property (strong, nonatomic) IBOutlet UIStackView *view5;
@property (strong, nonatomic) IBOutlet UIStackView *view6;
@property (strong, nonatomic) IBOutlet UIStackView *view7;
@property (strong, nonatomic) IBOutlet UIStackView *view8;
@property (strong, nonatomic) IBOutlet UIStackView *view9;

@property (strong, nonatomic) IBOutlet UITextField *text1;
@property (strong, nonatomic) IBOutlet UITextField *text2;
@property (strong, nonatomic) IBOutlet UITextField *text3;
@property (strong, nonatomic) IBOutlet UITextField *text4;
@property (strong, nonatomic) IBOutlet UITextField *text5;
@property (strong, nonatomic) IBOutlet UITextField *text6;
@property (strong, nonatomic) IBOutlet UITextField *text7;
@property (strong, nonatomic) IBOutlet UITextField *text8;
@property (strong, nonatomic) IBOutlet UITextField *text9;

@property (nonatomic, assign) NSInteger count;

@property (strong, nonatomic) IBOutlet PolygonAttributeView *viewAttri;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.count = 6;
    
    [self textFieldDidEndEditing:_text1];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 100) {
        self.count = [textField.text integerValue];
    } else {
        [self changeScore];
    }
}

- (IBAction)changeValue:(UITextField *)sender
{
    
}



- (void)setCount:(NSInteger)count
{
    if (count < 2) {
        count = 2;
    }
    if (count > 9) {
        count = 9;
    }
    
    _count = count;
    
    NSArray *arrView = @[_view1, _view2, _view3, _view4, _view5, _view6, _view7, _view8, _view9];
    for (NSInteger i = 0; i < arrView.count; i++) {
        UIView *view = arrView[i];
        view.hidden = i + 1 > _count? YES: NO;
    }
}

- (void)changeScore
{
    NSArray *arrField = @[_text1, _text2, _text3, _text4, _text5, _text6, _text7, _text8, _text9];
    
    NSMutableArray *arrScore = [NSMutableArray arrayWithCapacity:_count];
    for (NSInteger i = 0; i < _count; i++) {
        UITextField *field = arrField[i];
        CGFloat score = [field.text floatValue];
        [arrScore addObject:[NSNumber numberWithFloat:score]];
    }
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.4];
    
//    __weak typeof(self) weakSelf = self;
//    [UIView animateWithDuration:0.3 animations:^{
//        weakSelf.viewAttri.arrSocre = arrScore;
//    }];

    _viewAttri.arrSocre = arrScore;
    
    [CATransaction commit];
}

@end
