//
//  NWGAlertView.m
//  AlertView
//
//  Created by 刘伟 on 17/1/19.
//  Copyright © 2017年 刘伟. All rights reserved.
//   

#import "NWGAlertView.h"
#import "TBCityIconFont.h"
#import "UIColor+ST.h"

@implementation NWGAlertView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
        
        self.whiteBackView = [[UIView alloc]init];
        self.whiteBackView.backgroundColor = [UIColor whiteColor];
        self.icon = [[UIImageView alloc]init];
        self.title = [[UILabel alloc]init];
        self.title.textAlignment = NSTextAlignmentCenter;
        self.title.font= [UIFont systemFontOfSize:18];
        
        self.subTitle = [[UILabel alloc]init];
        self.subTitle.textAlignment = NSTextAlignmentCenter;
        self.subTitle.font= [UIFont systemFontOfSize:14];
        self.subTitle.textColor = [UIColor grayColor];
        
        self.surebtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelbtn = [UIButton buttonWithType:UIButtonTypeCustom];
      
        [self addSubview:self.whiteBackView];
        [self addSubview:self.icon];
        [self addSubview:self.title];
        [self addSubview:self.subTitle];
        [self addSubview:self.surebtn];
        [self addSubview:self.cancelbtn];
    }
    return self;

}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat Width = [UIScreen mainScreen].bounds.size.width;
    
    self.whiteBackView.frame = CGRectMake(20, 100, Width-40, 220);
    self.whiteBackView.layer.cornerRadius=5;
    self.icon.frame = CGRectMake(CGRectGetMinX(self.whiteBackView.frame)+(self.whiteBackView.frame.size.width-70)/2, CGRectGetMinY(self.whiteBackView.frame), 70, 70);
    
    self.title.frame = CGRectMake(CGRectGetMinX(self.whiteBackView.frame), CGRectGetMaxY(self.icon.frame)+10, self.whiteBackView.frame.size.width, 40);
    self.subTitle.frame = CGRectMake(CGRectGetMinX(self.whiteBackView.frame), CGRectGetMaxY(self.title.frame)+10, self.whiteBackView.frame.size.width, 40);

    //NSLog(@"btnType = %u",self.btnType);
    int typeA = self.btnType;
    switch (typeA) {
        case 0:
            self.surebtn.frame = CGRectMake(CGRectGetMinX(self.whiteBackView.frame)+(self.whiteBackView.frame.size.width-70)/2, CGRectGetMaxY(self.subTitle.frame), 80, 40);
            self.surebtn.layer.cornerRadius=5;
            [self.surebtn setTitle:@"下载" forState:UIControlStateNormal];
            [self.surebtn addTarget:self action:@selector(sure:) forControlEvents:UIControlEventTouchUpInside];
            self.surebtn.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:70.0/255.0 blue:94.0/255.0 alpha:1];
            break;
            
        case 1:
            
            self.cancelbtn.frame = CGRectMake(CGRectGetMinX(self.whiteBackView.frame)+(self.whiteBackView.frame.size.width-150)/2, CGRectGetMaxY(self.subTitle.frame), 70, 40);
            self.cancelbtn.layer.cornerRadius=5;
            [self.cancelbtn setTitle:@"取消" forState:UIControlStateNormal];
            [self.cancelbtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
            self.cancelbtn.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1];
            [self.cancelbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            self.surebtn.frame = CGRectMake(CGRectGetMaxX(self.cancelbtn.frame)+10, CGRectGetMaxY(self.subTitle.frame), 80, 40);
            self.surebtn.layer.cornerRadius=5;
            [self.surebtn setTitle:@"下载" forState:UIControlStateNormal];
            [self.surebtn addTarget:self action:@selector(sure:) forControlEvents:UIControlEventTouchUpInside];
            self.surebtn.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:70.0/255.0 blue:94.0/255.0 alpha:1];
            break;
        case 2:
            self.surebtn.frame = CGRectMake(CGRectGetMinX(self.whiteBackView.frame)+(self.whiteBackView.frame.size.width-70)/2, CGRectGetMaxY(self.subTitle.frame), 80, 40);
            self.surebtn.layer.cornerRadius=5;
            [self.surebtn setTitle:@"确认" forState:UIControlStateNormal];
            [self.surebtn addTarget:self action:@selector(sure:) forControlEvents:UIControlEventTouchUpInside];
            self.surebtn.backgroundColor = [UIColor colorWithRed:164.0/255.0 green:222/255.0 blue:246/255.0 alpha:1];
            break;
        default:
            break;
    }
    
}

-(void)sure:(UIButton *)btn {
    //NSLog(@"下载 %@",btn);
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha=0;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    NWGBlock buttonClickBlock = self.buttonClickBlock;
    buttonClickBlock(btn);
}
-(void)cancel:(UIButton *)btn {
    //NSLog(@"取消");
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha=0;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    NWGBlock buttonClickBlock = self.buttonClickBlock;
    buttonClickBlock(btn);
}

-(void)creatNWGView:(NWGViewType)iconType withTitle:(NSString *)title andSubTitle:(NSString *)subtitle andClickBlock:(NWGBlock)buttonClickBlock{
    
    self.buttonClickBlock = buttonClickBlock;
    
    self.title.text= title;
    self.subTitle.text = subtitle;
    
    switch (iconType) {
        case 0:
        case 1:
            //&#xe662;
            self.icon.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e652", 60, [UIColor colorWithRed:252.0/255.0 green:182/255.0 blue:125/255.0 alpha:1])];
            break;
        case 2:
            //&#xe662;
            self.icon.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e689", 60, [UIColor colorWithRed:251.0/255.0 green:130.0/255.0 blue:138.0/255.0 alpha:1])];
            break;
        default:
            break;
    }
    self.btnType = iconType;
    [self setNeedsDisplay];
}


//iconFont参考 http://www.jianshu.com/p/c3405c6a58e4

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
