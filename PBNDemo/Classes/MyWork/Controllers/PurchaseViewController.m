//
//  PurchaseViewController.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/18.
//  Copyright © 2020 常威. All rights reserved.
//

#import "PurchaseViewController.h"

@interface PurchaseViewController ()<UINavigationControllerDelegate>

@end

#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height

@implementation PurchaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.delegate = self;
    [self setupBase];
    PurchaseScrollView *purchaseScrollview = [[PurchaseScrollView alloc] initWithFrame:CGRectMake(5, 120, WIDTH-10, HEIGHT-160)];
    [self.view addSubview:purchaseScrollview];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //判断要显示的控制器是否是自己
    BOOL isShowhomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowhomePage animated:YES];
}

- (void)dealloc{
    self.navigationController.delegate = nil;
}

- (void)setupBase{
    self.view.backgroundColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelBtn.frame = CGRectMake(WIDTH-60, 30, 30, 30);
    cancelBtn.backgroundColor = [UIColor whiteColor];
    [cancelBtn setTitle:@"❌" forState:UIControlStateNormal];
    cancelBtn.tintColor = [UIColor blackColor];
    cancelBtn.tag = 1000;
    [cancelBtn addTarget:self action:@selector(backBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2 - 120, 50, 240, 30)];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.text = @"Paint by Number";
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont fontWithName:@"Arial" size:26];
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2 - 100, 80, 200, 30)];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = @"Premiun";
    label2.textColor = [UIColor whiteColor];
    label2.font = [UIFont fontWithName:@"Arial" size:26];
    [self.view addSubview:label2];
}

- (void)backBtnPress:(UIButton *)sender{
    if(sender.tag == 1000){
        self.navigationController.navigationBarHidden = NO;
        [self.navigationController popViewControllerAnimated:YES];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
