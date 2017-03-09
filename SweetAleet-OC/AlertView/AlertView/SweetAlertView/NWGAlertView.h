//
//  NWGAlertView.h
//  AlertView
//
//  Created by 刘伟 on 17/1/19.
//  Copyright © 2017年 刘伟. All rights reserved.
//  

#import <UIKit/UIKit.h>

typedef enum{
    forceupdate,  //0 强制更新
    enableupdate, //1 可用更新
    warning       //2 确认
}NWGViewType;

typedef void(^NWGBlock)(UIButton *btn); //取消 下载 确定按钮的回调

@interface NWGAlertView : UIView

@property(nonatomic,strong)UIView *whiteBackView;
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UILabel *subTitle;
@property(nonatomic,strong)UIButton *surebtn;
@property(nonatomic,strong)UIButton *cancelbtn;
@property(nonatomic)NWGViewType btnType;
@property (nonatomic,copy) NWGBlock buttonClickBlock;

//弹窗创建方法
-(void)creatNWGView:(NWGViewType)iconType withTitle:(NSString *)title andSubTitle:(NSString *)subtitle andClickBlock:(NWGBlock)buttonClickBlock;

@end
