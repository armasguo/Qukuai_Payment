//
//  downDialogView.h
//  GKCoverDemo
//
//  Created by Armas on 2017/1/17.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface downDialogView : UIView
@property (weak, nonatomic) IBOutlet UIButton *payConfirmBtn;
//支付金额
@property (weak, nonatomic) IBOutlet UILabel *money;

//支付方式按钮集合
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *wayToPay;

//另外的支付方式按钮
@property (weak, nonatomic) IBOutlet UIButton *nextWayToPayBtn;


//记录当前高亮显示的支付方式的内容
@property(strong,nonatomic) NSString* selected_wayToPay;

//司机信息label集合，依次为名字、车类型、车牌、手机号、接单数
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *driverInfo;

//评价按钮集合
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *stars;

//头像
@property (weak, nonatomic) IBOutlet UIImageView *driver_head;

-(instancetype)initWithoutFrame;
+(instancetype)nibFromThisView:(NSString*)xibFileName;
@end

