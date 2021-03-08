//
//  MainTabBarViewController.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/15.
//  Copyright © 2020 常威. All rights reserved.
//

#import "MainTabBarViewController.h"
#import <PBNDemo-Swift.h>

@interface MainTabBarViewController (){
    //未选中时的图片
    NSArray *aryImage;
    //选中时的图片
    NSArray *arySelImage;
    //所有标题
    NSArray *aryTitle;
    //按钮数量
    int num;
}

@property (nonatomic, strong) UIButton *selectedBtn;

//自定义TabBar
- (void)loadCustomTabBar;
//定义私有方法装载子视图控制器
- (void)loadViewControllers;


@end

@implementation MainTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadCustomTabBar];
    [self loadViewControllers];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


- (void)loadCustomTabBar{
    //添加数据
    num = 4;
    aryImage = [[NSArray alloc] initWithObjects:@"icon_library_default", @"icon_explore_default", @"icon_news_default", @"icon_mywork_default", nil];
    arySelImage = [[NSArray alloc] initWithObjects:@"icon_library_highlight", @"icon_explore_highlight", @"icon_news_highlight", @"icon_mywork_highlight", nil];
    aryTitle = [[NSArray alloc] initWithObjects:@"Library", @"Explore", @"News", @"My Work", nil];
    
    //删除现有的tabBar
    CGRect rect = self.tabBar.frame;
    //移除TabBarController自带的下部的条
    [self.tabBar removeFromSuperview];
    
    //添加自己的视图
    UIImageView *myImageView = [[UIImageView alloc] init];
    myImageView.userInteractionEnabled = YES;
    myImageView.frame = rect;    myImageView.backgroundColor = [UIColor whiteColor];
    
    UIView *horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 0.5)];
    horizontalLine.backgroundColor = [UIColor colorWithRed:245/255 green:245/255 blue:245/255 alpha:1.0];
    [myImageView addSubview:horizontalLine];
    [self.view addSubview:myImageView];
    
    for(int i=0; i<num; i++){
        //添加按钮
        UIButton *btn = [[UIButton alloc] init];
        CGFloat x = i * myImageView.frame.size.width / num;
        btn.frame = CGRectMake(x, 0, myImageView.frame.size.width / num, myImageView.frame.size.height);
        [myImageView addSubview:btn];
        
        //添加图标
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((btn.bounds.size.width-30)/2, 3, 30, 30)];
        imageView.tag = 200 + i;
        imageView.image = [UIImage imageNamed:aryImage[i]];
        [btn addSubview:imageView];
        
        //添加标题
        UILabel *labelTitle = [[UILabel alloc] init];
        labelTitle.tag = 100 + i;
        labelTitle.frame = CGRectMake(0, 33, btn.bounds.size.width, 12);
        labelTitle.textColor = [UIColor grayColor];
        labelTitle.backgroundColor = [UIColor clearColor];
        labelTitle.font = [UIFont systemFontOfSize:11];
        labelTitle.textAlignment = NSTextAlignmentCenter;
        labelTitle.text = aryTitle[i];
        [btn addSubview:labelTitle];
        
        //设置按钮标记，方便索引，并跳转到相应视图
        btn.tag = i;
        
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        //设置刚进入时，第一个按钮位选中状态
        if(i == 0){
            imageView.image = [UIImage imageNamed:arySelImage[i]];
            labelTitle.textColor = [UIColor blackColor];
            btn.selected = YES;
            self.selectedBtn = btn;
        }
        
    }
}

//按钮点击事件
- (void)clickBtn:(UIButton *)button{
    //设置所有按钮状态
    for(int i=0; i<num; i++){
        UILabel *labTitle = (UILabel *)[self.view viewWithTag:100+i];
        UIImageView *imgView = (UIImageView *)[self.view viewWithTag:200+i];
        if(i == button.tag){
            imgView.image = [UIImage imageNamed:arySelImage[i]];
            labTitle.textColor = [UIColor blackColor];
        }
        else{
            imgView.image = [UIImage imageNamed:aryImage[i]];
            labTitle.textColor = [UIColor grayColor];
        }
    }
    
    //将之前选中的按钮设置为未选中
    self.selectedBtn.selected = NO;
    //将当前按钮设置为选中
    button.selected = YES;
    //把当前按钮赋值给之前选中的按钮
    self.selectedBtn = button;
    //跳转到相应视图控制器
    self.selectedIndex = button.tag;
}

- (void)loadViewControllers{
    UIViewController *libraryPage = [[UIViewController alloc] init];
    
    ExploreViewController *explorePage = [[ExploreViewController alloc] init];
    
    NewsViewController *newsPage = [[NewsViewController alloc] init];
    
    MyWorkViewController *myWorkPage = [[MyWorkViewController alloc] init];
    UINavigationController *myWorkNavigation = [[UINavigationController alloc] initWithRootViewController:myWorkPage];
    
    //创建数组，将以上视图的导航控制器添加到导航栏中
    NSArray *viewControllers = @[libraryPage, explorePage, newsPage, myWorkNavigation];
    [self setViewControllers:viewControllers animated:YES];
    
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
