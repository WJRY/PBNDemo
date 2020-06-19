//
//  MyWorkViewController.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/17.
//  Copyright © 2020 常威. All rights reserved.
//

#import "MyWorkViewController.h"

@interface MyWorkViewController ()<UIScrollViewDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) MyWorkScrollView *myWorkScrollView;
//@property (strong, nonatomic) MyWorkScrollViewModels *myWorkScrollViewModels;
@end

@implementation MyWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _myWorkScrollView = [[MyWorkScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_myWorkScrollView];
    _myWorkScrollView.delegate = self;
    self.navigationController.delegate = self;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //判断要显示的控制器是否是自己
    BOOL isShowhomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowhomePage animated:YES];
}

- (void)dealloc{
    self.navigationController.delegate = nil;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.myWorkScrollView.settingButton addTarget:self action:@selector(settingTap) forControlEvents:UIControlEventTouchUpInside];
}

- (void)settingTap{
    SettingViewController *settingViewController = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:settingViewController animated:YES];
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
