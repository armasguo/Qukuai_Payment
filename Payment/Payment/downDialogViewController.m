//
//  downDialogViewController.m
//  Payment
//
//  Created by Armas on 2017/1/17.
//  Copyright © 2017年 Armas. All rights reserved.
//

#import "downDialogViewController.h"


@interface downDialogViewController ()

@end

@implementation downDialogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cancelPayBtn_event:self.cancelPay];
    // Do any additional setup after loading the view.
}
#pragma mark - 初始化downDialogView以及其各控件事件
-(void)createDownDialogView_ControlEvents:(CGRect)frame{
#pragma mark enable取消支付按钮
    self.cancelPay.enabled = YES;
    
    self.downView =
    [[downDialogView alloc] initWithFrame:frame];
    
    [self payConfirmBtn_event:self.downView.payConfirmBtn];
    
    for(id btn in self.downView.wayToPay){
        [self wayToPayBtn_event:btn];
    }
    
    [self nextWayToPayBtn_event:self.downView.nextWayToPayBtn];
}

#pragma mark - 全透明遮罩-底部弹窗-点击背景底部弹窗消失
//- (IBAction)transparentCover:(id)sender {
//    CGSize size_downDialogView_nib = [downDialogView nibFromThisView:NSStringFromClass([downDialogView class])].frame.size;
//    [self createDownDialogView_ControlEvents:CGRectMake(0,[[UIScreen mainScreen] bounds].size.height - size_downDialogView_nib.height,
//                                                        size_downDialogView_nib.width, size_downDialogView_nib.height)];
//    
//    [GKCover transparentCoverFrom:self.view content:self.downView animated:YES];
//}


#pragma mark - 绑定确认支付按钮事件
-(void)payConfirmBtn_event:(id) btn{
    [btn addTarget:self action:@selector(payConfirmBtn:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 绑定支付方式按钮事件
-(void)wayToPayBtn_event:(id) btn{
    [btn addTarget:self action:@selector(wayToPayBtn:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 绑定额外支付方式按钮事件
-(void)nextWayToPayBtn_event:(id) btn{
    [btn addTarget:self action:@selector(nextWayToPayBtn:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 绑定取消支付按钮
-(void)cancelPayBtn_event:(id) btn{
    [btn addTarget:self action:@selector(cancelPayBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - 自定义全透明遮罩-可自定义点击背景时的处理函数
- (IBAction)customTransparentCover:(id)sender {
    [self customTransparentCover_helper];
}
#pragma mark 初始化cover和downDialogView
-(void)customTransparentCover_helper{
    GKCover *cover = [GKCover transparentCoverWithTarget:self action:@selector(hidden)];
    cover.frame = self.view.bounds;
    [self.view addSubview:cover];
    self.cover = cover;
    
    CGSize size_downDialogView_nib = [downDialogView nibFromThisView:NSStringFromClass([downDialogView class])].frame.size;
    [self createDownDialogView_ControlEvents:CGRectMake(0,KScreenH,size_downDialogView_nib.width, size_downDialogView_nib.height)];
    [self.view addSubview:self.downView];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.downView.gk_y = KScreenH - size_downDialogView_nib.height;
    }];
}

#pragma mark - 自定义点击背景时，事件处理
- (void)hidden{
    [UIView animateWithDuration:0.25 animations:^{
        self.downView.gk_y = KScreenH-self.downView.payConfirmBtn.gk_height;
        
        [self.downView.payConfirmBtn setTitle:@"继续支付" forState:UIControlStateNormal];
    }completion:^(BOOL finished) {
        [self.cover removeFromSuperview];
//      [self.downView removeFromSuperview];
        
    }];
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
