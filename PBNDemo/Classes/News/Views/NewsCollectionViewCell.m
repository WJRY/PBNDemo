//
//  NewsCollectionViewCell.m
//  PBNDemo
//
//  Created by 常威 on 2020/6/15.
//  Copyright © 2020 常威. All rights reserved.
//

#import "NewsCollectionViewCell.h"

@implementation NewsCollectionViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
    if(self){
        [self setup];
    }
}

- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    [self.layer setCornerRadius:5];
    self.button.backgroundColor = [UIColor colorWithRed:164.0/255.0 green:111.0/255.0 blue:231.0/255.0 alpha:1.0];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.model.imageURL] placeholderImage:nil options:SDWebImageRetryFailed
                            completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL){
       }
    ];
    [self.imageView.layer setCornerRadius:2];
    
    self.labelTitle.text = self.model.textTitle;
    [self.labelTitle setFont:[UIFont systemFontOfSize:14]];
    self.labelTitle.lineBreakMode = NSLineBreakByWordWrapping;
    
    self.labelText.text = self.model.textDesc;
    [self.labelText setFont:[UIFont systemFontOfSize:12]];
    self.labelText.textColor = [UIColor colorWithRed:165.0/255.0 green:160.0/255.0 blue:167.0/255.0 alpha:1.0];
    
    [self.button setTitle:self.model.buttonText forState:UIControlStateNormal];
    [self.button.layer setCornerRadius:10];
    
    CGFloat cellWidth = self.bounds.size.width;
    CGFloat cellHeight = self.bounds.size.height;
            
    _imageView.frame = CGRectMake(5, 5, cellHeight-10, cellHeight-10);
            
    _labelTitle.frame = CGRectMake(cellHeight+10, 5, cellWidth-cellHeight-30, cellHeight/4.0);
            
    _labelText.frame = CGRectMake(cellHeight+15, 5+cellHeight/4.0, cellWidth-cellHeight-30, cellHeight/4.0);
            
            
    _button.frame = CGRectMake(cellWidth*2.5/3.5 - 20, cellHeight*3.0/4.0 - 10, cellWidth/3.5, cellHeight/4.0 );
    [self.contentView addSubview:_imageView];
    [self.contentView addSubview:_labelTitle];
    [self.contentView addSubview:_labelText];
    [self.contentView addSubview:_button];
}

- (void)setModel:(NewsCollectionCellModel *)model{
    _model = model;
}

- (UIButton *)button{
    if(!_button){
        _button = [[UIButton alloc]  init];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UIImageView *)imageView{
    if(!_imageView){
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)labelText{
    if(!_labelText){
        _labelText = [[UILabel alloc] init];
    }
    return _labelText;
}

- (UILabel *)labelTitle{
    if(!_labelTitle){
        _labelTitle = [[UILabel alloc] init];
    }
    return _labelTitle;
}

- (void)buttonAction:(UIButton *)bt{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.model.linkText] options:@{} completionHandler:nil];
}


@end
