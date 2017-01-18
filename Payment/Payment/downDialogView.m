//
//  downDialogView.m
//  GKCoverDemo
//
//  Created by Armas on 2017/1/17.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "downDialogView.h"


@interface downDialogView()


@end
@implementation downDialogView

/*/////
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0];
        self.frame = frame;
        [self init_control];
    }
    
    return self;
}

-(instancetype)initWithoutFrame{
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0];
    [self init_control];

    return self;
}

/**
 *  初始化各控件
 */
-(void)init_control{
    //设置支付按钮圆角
    [self.payConfirmBtn.layer setCornerRadius:20];
    
    //初始化支付金额
    self.money.text = @"￥100";
    
    //设置默认支付方式为CarCoin
    for(UIButton* item in self.wayToPay){
        item.selected = NO;
    }
    [self.wayToPay[0] setSelected:YES];
    
    //记录支付方式内容
    self.selected_wayToPay = [self.wayToPay[0] currentTitle];
    
    //初始化star
    for(int i = 0;i < self.stars.count;i++){
        if(4 == i)
            continue;
        [self.stars[i] setSelected:YES];
    }
    
    
}

+(instancetype)nibFromThisView:(NSString *)xibFileName{
    return [[NSBundle mainBundle] loadNibNamed:xibFileName owner:nil options:nil][0];
}
@end
