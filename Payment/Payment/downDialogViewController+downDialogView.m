//
//  downDialogViewController+downDialogView.m
//  Payment
//
//  Created by Armas on 2017/1/17.
//  Copyright © 2017年 Armas. All rights reserved.
//

#import "downDialogViewController+downDialogView.h"

@implementation downDialogViewController (downDialogView)
#pragma mark - 确认支付按钮事件
-(void)payConfirmBtn:(id)sender{
    if([[sender currentTitle] isEqualToString:@"确认支付"]){
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Test" message:[NSString stringWithFormat:@"%@",[(UIButton*)sender currentTitle]] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }else if([[sender currentTitle] isEqualToString:@"继续支付"]){
        [self recoverPay];
    }
    
}

-(void)recoverPay{
    [self.downView.payConfirmBtn setTitle:@"确认支付" forState:UIControlStateNormal];
    [self.downView removeFromSuperview];
    
    if(self.cover)
        [self.view addSubview:self.cover];
    else{
        GKCover *cover = [GKCover transparentCoverWithTarget:self action:@selector(hidden)];
        cover.frame = self.view.bounds;
        [self.view addSubview:cover];
        self.cover = cover;
    }
    
    [self.view addSubview:self.downView];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.downView.gk_y = KScreenH - self.downView.gk_height;
    }];
}

#pragma mark - 取消支付按钮事件
-(void)cancelPayBtn:(id)sender{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"取消支付" message:@"确认取消支付吗？" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        //确认时取消底部视图
        [self destroyDownDialogView:0.5];
    }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:confirmAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];

}

#pragma mark - 支付方式按钮事件
-(void)wayToPayBtn:(id)sender{
    if(self.downView){
        //所有支付方式按钮改变为未选中状态
        for(UIButton* item in self.downView.wayToPay){
            [item setSelected:NO];
        }
        //被点击按钮改变为选中状态
        [(UIButton*)sender setSelected:YES];
        
        //记录新被选中按钮内容
        self.downView.selected_wayToPay = [(UIButton*)sender currentTitle];
    }
}

#pragma mark - 额外支付方式按钮事件
-(void)nextWayToPayBtn:(id)sender{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Test" message:@"未完成" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - 销毁底部视图
-(void)destroyDownDialogView:(NSTimeInterval) _animateWithDuration{
    [UIView animateWithDuration:_animateWithDuration animations:^{
        self.downView.gk_y = KScreenH;
    }completion:^(BOOL finished) {
        [self.cover removeFromSuperview];
        [self.downView removeFromSuperview];
        self.cover = nil;
        self.downView = nil;
    }];
}
@end
