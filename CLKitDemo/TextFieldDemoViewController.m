//
//  TextFieldDemoViewController.m
//  CLKitDemo
//
//  Created by KaKa on 2017/3/1.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "TextFieldDemoViewController.h"

@interface TextFieldDemoViewController ()<KKBaseTextFieldDelegate,KKBaseTextFieldDataSource>
@property (nonatomic,strong) NSArray*                 addressArray;
@property (nonatomic,strong) NSArray*                 genderArray;
@end

@implementation TextFieldDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _addressArray = @[@"北京",@"天津",@"上海",@"重庆",@"成都",@"广州",@"福建",@"厦门"];
    _genderArray = @[@"男",@"女"];
    KKBaseTextField* tf = [KKBaseTextField textFieldWithPlaceholder:@"请输入用户名"].tfTitleLeftView(@"用户名",CGSizeMake(60, 40),10);
    [self.view addSubview:tf];
    
    KKBaseTextField* tf1 = [KKBaseTextField textFieldWithPlaceholder:@"请输入密码"].tfTitleLeftView(@"密码",CGSizeMake(60, 40),10).tfSecureTextEntry(YES);
    [self.view addSubview:tf1];
    
    KKBaseTextField* tf3 = [KKBaseTextField textFieldWithPlaceholder:@"请输入用户名"].tfImageLeftView(@"user",CGSizeMake(40, 40));
    [self.view addSubview:tf3];
    
    KKBaseTextField* tf4 =
    [KKBaseTextField textFieldWithPlaceholder:@"请输入手机号"]
    .tfImageLeftView(@"phone",CGSizeMake(40, 40))
    .tfCreateToolbar()
    .tfTextEdgeInsets(UIEdgeInsetsMake(0, 5, 0, 5))
    .tfTextMaxLength(11)
    .tfTextAutoSegment();
    [self.view addSubview:tf4];
    
    KKBaseTextField* tf5 =
    [KKBaseTextField textFieldWithPlaceholder:@"请选择地址"]
    .tfImageLeftView(@"address",CGSizeMake(40, 40))
    .tfCreatePickerView()
    .tfImageRightView(@"arrow_right",CGSizeMake(40, 40));
    tf5.baseTextFieldDelegate = self;
    tf5.baseTextFieldDataSource = self;
    [self.view addSubview:tf5];
    
    KKBaseTextField* tf6 =
    [KKBaseTextField textFieldWithPlaceholder:@"请选择性别"]
    .tfImageLeftView(@"gender",CGSizeMake(40, 40))
    .tfCreateActionSheet(@"请选择性别",@"取消")
    .tfImageRightView(@"arrow_right",CGSizeMake(40, 40));
    tf6.baseTextFieldDelegate = self;
    tf6.baseTextFieldDataSource = self;
    [self.view addSubview:tf6];
    
    KKBaseTextField* tf7 =
    [KKBaseTextField textFieldWithPlaceholder:@"请选择日期"]
    .tfImageLeftView(@"date",CGSizeMake(40, 40))
    .tfCreateDatePicker(UIDatePickerModeDate,@"yyyy-MM-dd")
    .tfImageRightView(@"arrow_right",CGSizeMake(40, 40));
    tf7.baseTextFieldDelegate = self;
    [self.view addSubview:tf7];

    
    [tf mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.centerX.equalTo(self.view);
        maker.width.equalTo(@300);
        maker.height.equalTo(@40);
        maker.top.equalTo(@100);
    }];
    [tf1 mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.left.width.height.equalTo(tf);
        maker.top.equalTo(tf.mas_bottom).offset(10);
    }];
    [tf3 mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.left.width.height.equalTo(tf);
        maker.top.equalTo(tf1.mas_bottom).offset(10);
    }];
    [tf4 mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.left.width.height.equalTo(tf);
        maker.top.equalTo(tf3.mas_bottom).offset(10);
    }];
    [tf5 mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.left.width.height.equalTo(tf);
        maker.top.equalTo(tf4.mas_bottom).offset(10);
    }];
    [tf6 mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.left.width.height.equalTo(tf);
        maker.top.equalTo(tf5.mas_bottom).offset(10);
    }];
    [tf7 mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.left.width.height.equalTo(tf);
        maker.top.equalTo(tf6.mas_bottom).offset(10);
    }];
    
}

#pragma mark --------------------pickerView--------------------
-(NSInteger)textFieldNumberOfRowInPickerView:(KKBaseTextField *)textField {
    return _addressArray.count;
}

-(NSString *)textFiled:(KKBaseTextField *)textFiled pickViewTitleForRow:(NSInteger)row {
    return _addressArray[row];
}

#pragma mark --------------------actionSheet--------------------
-(NSInteger)textFieldNumberOfButtonsInActionSheet:(KKBaseTextField *)textField {
    return _genderArray.count;
}

-(NSString *)textFiled:(KKBaseTextField *)textFiled actionSheetTitleForIndex:(NSInteger)row {
    return _genderArray[row];
}

-(void)textFiled:(KKBaseTextField *)textFiled didSelectInputView:(NSInteger)index {
    NSLog(@"didSelectInputView === %ld",index);
}

-(void)textFiledDidEndEdit:(KKBaseTextField *)textField {
    NSLog(@"text === %@",textField.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
