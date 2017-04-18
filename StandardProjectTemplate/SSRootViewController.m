//
//  SSRootViewController.m
//  StandardProjectTemplate
//
//  Created by CIZ on 17/4/18.
//  Copyright © 2017年 JSong. All rights reserved.
//

#import "SSRootViewController.h"
#import <Masonry.h>
#import "SSOWManager.h"
#import "FybrManager.h"
#import "TapjoyManager.h"
#import "UIView+PinToast.h"

@interface SSRootViewController ()

@property (nonatomic, strong) UIButton *button0;
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;

@end

@implementation SSRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self startOW];
    [self configureViews];
}

- (void)startOW {
    
    NSString *user_id = @"user_id_jaysmi";
    
}

- (void)configureViews {
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.button0];
    [self.button0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-100);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(60);
    }];
    
    [self.view addSubview:self.button1];
    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(60);
    }];
    
    [self.view addSubview:self.button2];
    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(100);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(60);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

- (void)onButton:(id)sender {
    UIButton *button = (UIButton *)sender;
    if ([button isEqual:self.button0]) {
        [[SSOWManager sharedInstance] showWithViewController:self withUnavailableBlock:^{
            [self.view makePinToast:@"Supersonic is not ready, please try again later"];
        }];
        
    } else if ([button isEqual:self.button1]) {
        [[FybrManager sharedInstance] showWithViewController:self withCustomInfoDic:nil withUnavailableBlock:^{
            [self.view makePinToast:@"Fyber is not ready, please try again later"];
        }];
        
    } else if ([button isEqual:self.button2]) {
        [[TapjoyManager sharedInstance] showWithViewController:self withUnavailableBlock:^{
            [self.view makePinToast:@"Tapjoy is not ready, please try again later"];
        }];
    }
}

#pragma mark - Getter

- (UIButton *)button0 {
    if (!_button0) {
        _button0 = [UIButton buttonWithType:UIButtonTypeCustom];
        _button0.backgroundColor = [UIColor blueColor];
        [_button0 setTitle:@"Supersonic" forState:UIControlStateNormal];
        [_button0 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button0;
}

- (UIButton *)button1 {
    if (!_button1) {
        _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _button1.backgroundColor = [UIColor blueColor];
        [_button1 setTitle:@"Fyber" forState:UIControlStateNormal];
        [_button1 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button1;
}

- (UIButton *)button2 {
    if (!_button2) {
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _button2.backgroundColor = [UIColor blueColor];
        [_button2 setTitle:@"Tapjoy" forState:UIControlStateNormal];
        [_button2 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button2;
}

@end
