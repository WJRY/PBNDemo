//
//  PurchaseScrollView.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/18.
//  Copyright © 2020 常威. All rights reserved.
//

#import "PurchaseScrollView.h"

#define WIDTH self.bounds.size.width
#define HEIGHT self.bounds.size.height

@implementation PurchaseScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setupbase];
        [self layoutLabels];
        [self LayoutButtons];
    }
    return self;
}

- (void)setupbase{
    self.showsVerticalScrollIndicator = FALSE;
    self.backgroundColor = [UIColor whiteColor];
    self.pagingEnabled = NO;
    self.contentSize = CGSizeMake(self.bounds.size.width-10, self.bounds.size.height * 1.2);
    self.layer.cornerRadius = 10.0f;
}

- (void)layoutLabels{
    UILabel *scrLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(60, 25, 200, 15)];
    scrLabel1.text = @"✅移除所有广告";
    scrLabel1.font = [UIFont fontWithName:@"Arial" size:16];
    [self addSubview:scrLabel1];
    
    UILabel *scrLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(60, 60, 200, 15)];
    scrLabel2.text = @"✅移除水印";
    scrLabel2.font = [UIFont fontWithName:@"Arial" size:16];
    [self addSubview:scrLabel2];
    
    UILabel *scrLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(60, 95, 200, 15)];
    scrLabel3.text = @"✅每日50个免费宝石";
    scrLabel3.font = [UIFont fontWithName:@"Arial" size:16];
    [self addSubview:scrLabel3];
    
    UILabel *scrLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(60, 130, 300, 15)];
    scrLabel4.text = @"✅Get Double Hints For the Same Price";
    scrLabel4.font = [UIFont fontWithName:@"Arial" size:16];
    [self addSubview:scrLabel4];
}

- (void)LayoutButtons{
//设置按钮
    //按钮1
//    _scrBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH/2 - 190, 200, 100, 100)];
    _scrBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(5, 200, 100, 100)];
    _scrBtn1.layer.cornerRadius = 5.0f;
    [_scrBtn1.layer setBorderWidth:2.0];
    _scrBtn1.layer.borderColor = [UIColor grayColor].CGColor;
    _scrBtn1.tag = 1;
    [_scrBtn1 addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *btn1Label1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 15, 40, 10)];
    btn1Label1.textAlignment = NSTextAlignmentCenter;
    btn1Label1.text = @"1个月";
    btn1Label1.font = [UIFont fontWithName:@"Arial" size:12];
    
    UILabel *btn1Label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 35, 60, 20)];
    btn1Label2.textAlignment = NSTextAlignmentCenter;
    btn1Label2.text = @"¥9.99";
    btn1Label2.font = [UIFont fontWithName:@"Arial" size:18];
    
    [_scrBtn1 addSubview:btn1Label1];
    [_scrBtn1 addSubview:btn1Label2];
    [self addSubview:_scrBtn1];
    
    //按钮2
    _scrBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH/2 - 70, 180, 140, 140)];
    _scrBtn2.layer.cornerRadius = 5.0f;
    [_scrBtn2.layer setBorderWidth:2.0];
    _scrBtn2.layer.borderColor = [UIColor grayColor].CGColor;
    _scrBtn2.tag = 2;
    [_scrBtn2 addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *btn2Label3 = [[UILabel alloc] initWithFrame:CGRectMake(2, 2, 136, 30)];
    btn2Label3.textAlignment = NSTextAlignmentCenter;
    btn2Label3.text = @"最受欢迎";
    btn2Label3.textColor = [UIColor whiteColor];
    btn2Label3.backgroundColor = [UIColor grayColor];
    btn2Label3.tag = 102;
    [_scrBtn2 addSubview:btn2Label3];
    
    UILabel *btn2Label1 = [[UILabel alloc] initWithFrame:CGRectMake(40, 50, 60, 15)];
    btn2Label1.textAlignment = NSTextAlignmentCenter;
    btn2Label1.text = @"1周";
    btn2Label1.font = [UIFont fontWithName:@"Arial" size:16];
    
    UILabel *btn2Label2 = [[UILabel alloc] initWithFrame:CGRectMake(30, 70, 80, 30)];
    btn2Label2.textAlignment = NSTextAlignmentCenter;
    btn2Label2.text = @"¥3.99";
    btn2Label2.font = [UIFont fontWithName:@"Arial" size:24];
    
    [_scrBtn2 addSubview:btn2Label1];
    [_scrBtn2 addSubview:btn2Label2];
    [self addSubview:_scrBtn2];
    
    //按钮3
//    _scrBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH/2 + 90, 200, 100, 100)];
    _scrBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH - 105, 200, 100, 100)];
    _scrBtn3.layer.cornerRadius = 5.0f;
    [_scrBtn3.layer setBorderWidth:2.0];
    _scrBtn3.layer.borderColor = [UIColor grayColor].CGColor;
    _scrBtn3.tag = 3;
    [_scrBtn3 addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *btn3Label1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 15, 40, 10)];
    btn3Label1.textAlignment = NSTextAlignmentCenter;
    btn3Label1.text = @"1年";
    btn3Label1.font = [UIFont fontWithName:@"Arial" size:12];
    
    UILabel *btn3Label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 35, 60, 20)];
    btn3Label2.textAlignment = NSTextAlignmentCenter;
    btn3Label2.text = @"¥69.99";
    btn3Label2.font = [UIFont fontWithName:@"Arial" size:18];
    
    [_scrBtn3 addSubview:btn3Label1];
    [_scrBtn3 addSubview:btn3Label2];
    [self addSubview:_scrBtn3];
    
//添加订阅按钮
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH/2 - 170, 340, 340, 40)];
    self.btn.backgroundColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0];
    self.btn.layer.cornerRadius = 10.0f;
    
    UILabel *labLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(150, 5, 40, 15)];
    labLabel1.text = @"订阅";
    labLabel1.textColor = [UIColor whiteColor];
    labLabel1.textAlignment = NSTextAlignmentCenter;
    
    UILabel *labLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(90, 25, 160, 15)];
    labLabel2.textAlignment = NSTextAlignmentCenter;
    labLabel2.textColor = [UIColor whiteColor];
    labLabel2.font = [UIFont fontWithName:@"Arial" size:10];
    labLabel2.tag = 100;
    
    [self.btn addSubview:labLabel1];
    [self.btn addSubview:labLabel2];
    [self addSubview:self.btn];
    
//按钮初始化
    self.selectedBtn = [self viewWithTag:2];
    self.selectedBtn.layer.borderColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0].CGColor;
    [self viewWithTag:102].backgroundColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0];
    UILabel *lab = [self viewWithTag:100];
    lab.text = @"免费试用7天，然后$3.99/周";
    
//分割横线
    UIView *horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(10, 440, WIDTH-30, 1)];
    horizontalLine.backgroundColor = [UIColor grayColor];
    [self addSubview:horizontalLine];
    
//添加购买按钮
    //按钮1
    _purchaseBtn1 = [[UIButton alloc] initWithFrame:CGRectMake((WIDTH-10)/2 - 175, 450, 90, 90)];
    _purchaseBtn1.layer.cornerRadius = 5.0f;
    _purchaseBtn1.layer.borderColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0].CGColor;
    [_purchaseBtn1.layer setBorderWidth:2];
    [self addSubview:_purchaseBtn1];
    
    UIImageView *purchaseImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 20, 40, 40)];
    purchaseImageView1.image = [UIImage imageNamed:@"light-bulb"];
    [_purchaseBtn1 addSubview:purchaseImageView1];
    
    UILabel *purchaseLab1 = [[UILabel alloc] initWithFrame:CGRectMake(2, 65, 86, 25)];
    purchaseLab1.text = @"$0.99";
    purchaseLab1.textAlignment = NSTextAlignmentCenter;
//    purchaseLab1.backgroundColor = [UIColor lightGrayColor];
    purchaseLab1.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:207.0/255.0 blue:242.0/255.0 alpha:1.0];
    [_purchaseBtn1 addSubview:purchaseLab1];
    
    //按钮2
    _purchaseBtn2 = [[UIButton alloc] initWithFrame:CGRectMake((WIDTH-10)/2 - 45, 450, 90, 90)];
    _purchaseBtn2.layer.cornerRadius = 5.0f;
    _purchaseBtn2.layer.borderColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0].CGColor;
    [_purchaseBtn2.layer setBorderWidth:2];
    [self addSubview:_purchaseBtn2];
    
    UIImageView *purchaseImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 20, 40, 40)];
        purchaseImageView2.image = [UIImage imageNamed:@"light-bulb"];
        [_purchaseBtn2 addSubview:purchaseImageView2];
    
    UILabel *purchaseLab2 = [[UILabel alloc] initWithFrame:CGRectMake(2, 65, 86, 25)];
    purchaseLab2.text = @"$1.99";
    purchaseLab2.textAlignment = NSTextAlignmentCenter;
    purchaseLab2.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:207.0/255.0 blue:242.0/255.0 alpha:1.0];
    [_purchaseBtn2 addSubview:purchaseLab2];
    
    //按钮3
    _purchaseBtn3 = [[UIButton alloc] initWithFrame:CGRectMake((WIDTH-10)/2 + 85, 450, 90, 90)];
    _purchaseBtn3.layer.cornerRadius = 5.0f;
    _purchaseBtn3.layer.borderColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0].CGColor;
    [_purchaseBtn3.layer setBorderWidth:2];
    [self addSubview:_purchaseBtn3];
    
    UIImageView *purchaseImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 20, 40, 40)];
        purchaseImageView3.image = [UIImage imageNamed:@"light-bulb"];
        [_purchaseBtn3 addSubview:purchaseImageView3];
    
    UILabel *purchaseLab3 = [[UILabel alloc] initWithFrame:CGRectMake(2, 65, 86, 25)];
    purchaseLab3.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:207.0/255.0 blue:242.0/255.0 alpha:1.0];
    [_purchaseBtn3 addSubview:purchaseLab3];
}


- (void)clickBtn:(UIButton *)button{
    if(button.tag == 1){
        self.selectedBtn = [self viewWithTag:1];
        self.selectedBtn.layer.borderColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0].CGColor;
    }
    else{
        [self viewWithTag:1].layer.borderColor = [UIColor grayColor].CGColor;
    }
    if(button.tag == 2){
        self.selectedBtn = [self viewWithTag:2];
        self.selectedBtn.layer.borderColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0].CGColor;
        [self viewWithTag:102].backgroundColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0];
        UILabel *lab = [self viewWithTag:100];
        lab.text = @"免费试用7天，然后$3.99/周";
    }
    else{
        [self viewWithTag:2].layer.borderColor = [UIColor grayColor].CGColor;
        [self viewWithTag:102].backgroundColor = [UIColor grayColor];
        UILabel *lab = [self viewWithTag:100];
        lab.text = @"";
    }
    if(button.tag == 3){
        self.selectedBtn = [self viewWithTag:3];
        self.selectedBtn.layer.borderColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0].CGColor;
    }
    else{
        [self viewWithTag:3].layer.borderColor = [UIColor grayColor].CGColor;
    }
}

@end
