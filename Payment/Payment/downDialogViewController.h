//
//  downDialogViewController.h
//  Payment
//
//  Created by Armas on 2017/1/17.
//  Copyright © 2017年 Armas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "downDialogView.h"
#import "UIView+GKExtension.h"
#import "GKCover.h"

@interface downDialogViewController : UIViewController
// 自定义遮罩
@property (nonatomic, weak) GKCover *cover;

//从下方弹出的视图
@property(strong,nonatomic) downDialogView* downView;
@property (weak, nonatomic) IBOutlet UIButton *cancelPay;


-(void)customTransparentCover_helper;
@end
