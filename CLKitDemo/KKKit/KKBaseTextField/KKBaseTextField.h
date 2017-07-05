//
//  KKBaseTextField.h
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import <UIKit/UIKit.h>

//!!!!: textfield的delegate已在本类实现
@protocol KKBaseTextFieldDelegate;
@protocol KKBaseTextFieldDataSource;
@interface KKBaseTextField : UITextField

@property (nonatomic, weak)id<KKBaseTextFieldDelegate>     baseTextFieldDelegate;
@property (nonatomic, weak)id<KKBaseTextFieldDataSource>   baseTextFieldDataSource;

+(instancetype)textField;

+(instancetype)textFieldWithPlaceholder:(NSString*)placeholder;

-(KKBaseTextField*(^)(CGRect frame))tfFrame;

-(KKBaseTextField*(^)(NSString* placeholder))tfPlaceholder;

-(KKBaseTextField*(^)(UIColor* color))tfPlaceholderColor;

-(KKBaseTextField*(^)(BOOL secureTextEntry))tfSecureTextEntry;

-(KKBaseTextField*(^)(UIKeyboardType type))tfKeyboardType;

/**
 默认白色
 */
-(KKBaseTextField*(^)(UIColor* color))tfBgColor;

/**
 默认14
 */
-(KKBaseTextField*(^)(id font))tfFont;

-(KKBaseTextField*(^)(UIColor* color))tfTextColor;

/**
 默认：UITextBorderStyleNone
 */
-(KKBaseTextField*(^)(UITextBorderStyle style))tfBorderStyle;

/**
 设置leftView。color为textfiled字体颜色，titlePadding为文本偏移
 */
-(KKBaseTextField*(^)(NSString* title,CGSize leftViewSize,CGFloat titlePadding))tfTitleLeftView;

/**
 image:可传image对象以及image名字字符串
 */
-(KKBaseTextField*(^)(id image,CGSize leftViewSize,CGFloat padding))tfImageLeftView;

-(KKBaseTextField*(^)(id image,CGSize rightViewSize,CGFloat padding))tfImageRightView;

-(KKBaseTextField*(^)(UIView* rightView,CGFloat padding))tfRightView;

-(KKBaseTextField*(^)(UIEdgeInsets insets))tfTextEdgeInsets;

/**
 文本最大长度
 */
-(KKBaseTextField*(^)(int maxLength))tfTextMaxLength;

/**
 每4个字符串自动插入空格
 */
-(KKBaseTextField*(^)())tfTextAutoSegment;

-(KKBaseTextField*(^)())tfCreateToolbar;

-(KKBaseTextField*(^)())tfCreatePickerView;

-(KKBaseTextField*(^)(NSString* title,NSString* cancelButtonTitle))tfCreateActionSheet;

-(KKBaseTextField*(^)(UIDatePickerMode mode,NSString* formatter))tfCreateDatePicker;

-(void)reloadPickerView;

-(void)reloadActionSheet;

@end

@protocol KKBaseTextFieldDelegate <NSObject>

@optional
-(void)textFieldDidClickCompleteButton:(KKBaseTextField*)textField;

-(void)textFiledDidEndEdit:(KKBaseTextField*)textField;

-(void)textFiled:(KKBaseTextField *)textFiled didSelectInputView:(NSInteger)index;


@end

@protocol KKBaseTextFieldDataSource <NSObject>

@optional
-(NSInteger)textFieldNumberOfRowInPickerView:(KKBaseTextField*)textField;

-(NSString *)textFiled:(KKBaseTextField *)textFiled pickViewTitleForRow:(NSInteger)row;

-(NSInteger)textFieldNumberOfButtonsInActionSheet:(KKBaseTextField*)textField;

-(NSString *)textFiled:(KKBaseTextField *)textFiled actionSheetTitleForIndex:(NSInteger)row;

@end

