//
//  KKBaseTextField.m
//  LoveCare
//
//  Created by KaKa on 15/12/3.
//  Copyright © 2015年 KaKa. All rights reserved.
//

#import "KKBaseTextField.h"

#define DEFAULT_TEXT_MIN_LEN                4

@interface KKBaseTextFieldLeftLabel : UILabel
@property (nonatomic,assign) CGFloat                 padding;

+(instancetype)leftLabelWithSize:(CGSize)size padding:(CGFloat)padding text:(NSString*)text;

@end

@implementation KKBaseTextFieldLeftLabel

+(instancetype)leftLabelWithSize:(CGSize)size padding:(CGFloat)padding text:(NSString *)text {
    KKBaseTextFieldLeftLabel* label = [[self alloc] init];
    label.frame = CGRectMake(0, 0, size.width, size.height);
    label.padding = padding;
    label.text = text;
    label.backgroundColor = [UIColor clearColor];
    return label;
}

-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect rect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    rect.origin.x = _padding;
    rect.origin.y = (CGRectGetHeight(bounds)-CGRectGetHeight(rect))/2;
    return rect;
}

-(void)drawTextInRect:(CGRect)rect {
    CGRect drawRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:drawRect];
}

@end

@interface KKBaseTextField()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,UIActionSheetDelegate>
@property (nonatomic,assign) CGRect                 rightViewRect;
@property (nonatomic,assign) UIEdgeInsets           textEdgeInsets;
@property (nonatomic,assign) int                    maxLength;
/**
 *  是否自动分割，默认为NO
 */
@property (nonatomic, assign) BOOL                  isAutoSegment;

@property (nonatomic, strong) UIPickerView*         pickerView;

@property (nonatomic, strong) NSMutableDictionary*  pickViewDataDict;

@property (nonatomic, strong) UIActionSheet*        actionSheet;

@property (nonatomic, assign) NSInteger             selectIndex;

@property (nonatomic, strong) UIDatePicker*         datePickerView;

@property (nonatomic, strong) NSDateFormatter*      formatter;


@end

@implementation KKBaseTextField

#pragma mark --------------------private--------------------
- (UIView*)imageForLeftOrRightView:(id)image size:(CGSize)size {
    UIImage* img = [image isKindOfClass:[UIImage class]]?image:[UIImage imageNamed:image];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:img];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [view addSubview:imageView];
    imageView.center = CGPointMake(size.width/2, size.height/2);
    return view;
}

#pragma mark -------------------- Set&&Get --------------------
-(UIPickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    return _pickerView;
}

-(NSMutableDictionary *)pickViewDataDict {
    if (!_pickViewDataDict) {
        _pickViewDataDict = [[NSMutableDictionary alloc] init];
    }
    return _pickViewDataDict;
}

-(UIDatePicker *)datePickerView {
    if (!_datePickerView) {
        _datePickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 216)];
        _datePickerView.backgroundColor = [UIColor whiteColor];
        [_datePickerView addTarget:self action:@selector(datePickerAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _datePickerView;
}

-(NSDateFormatter *)formatter {
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc] init];
    }
    return _formatter;
}

#pragma mark --------------------- Action ---------------------
-(void)textFieldDone {
    [self endEditing:YES];
    if (_baseTextFieldDelegate && [_baseTextFieldDelegate respondsToSelector:@selector(textFieldDidClickCompleteButton:)]) {
        [_baseTextFieldDelegate textFieldDidClickCompleteButton:self];
    }
}

-(void)datePickerAction:(UIDatePicker*)picker {
    self.text = [self.formatter stringFromDate:picker.date];
}

#pragma mark --------------- UITextFieldDelegate ---------------
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isFirstResponder]) {
        [textField resignFirstResponder];
    }
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if(_actionSheet) [_actionSheet showInView:self];
    if(_datePickerView) self.text = [self.formatter stringFromDate:self.datePickerView.date];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (_maxLength != 0 && textField.text.length >= _maxLength) {
        return range.length != 0;
    }
    if (_isAutoSegment && range.length != 1 && (textField.text.length+1)%(DEFAULT_TEXT_MIN_LEN+1) == 0) {
        textField.text = [textField.text stringByAppendingString:@" "];
    }
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    if(self.text.length == 0 && _pickerView)
        self.text = self.pickViewDataDict[[NSString stringWithFormat:@"%ld",_selectIndex]];
    if ([_baseTextFieldDelegate respondsToSelector:@selector(textFiledDidEndEdit:)]) {
        [_baseTextFieldDelegate textFiledDidEndEdit:self];
    }
}

#pragma mark ---------------UIPickerViewDelegate,UIPickerViewDataSource-------------
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_baseTextFieldDataSource textFieldNumberOfRowInPickerView:self];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString* title = [_baseTextFieldDataSource textFiled:self pickViewTitleForRow:row];
    [self.pickViewDataDict setValue:title forKey:[NSString stringWithFormat:@"%ld",row]];
    return title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _selectIndex = row;
    self.text = self.pickViewDataDict[[NSString stringWithFormat:@"%ld",row]];
    if ([_baseTextFieldDelegate respondsToSelector:@selector(textFiled:didSelectInputView:)]) {
        [_baseTextFieldDelegate textFiled:self didSelectInputView:_selectIndex];
    }
}

#pragma mark --------------------UIActionSheetDelegate--------------------
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(buttonIndex != 0) {
        self.text = [actionSheet buttonTitleAtIndex:buttonIndex];
    } else {
        [self endEditing:YES];
    }
    if ([_baseTextFieldDelegate respondsToSelector:@selector(textFiled:didSelectInputView:)]) {
        [_baseTextFieldDelegate textFiled:self didSelectInputView:buttonIndex];
    }
}

#pragma mark --------------- override ---------------
-(CGRect)rightViewRectForBounds:(CGRect)bounds {
    if (CGRectEqualToRect(CGRectZero, _rightViewRect)) {
        return [super rightViewRectForBounds:bounds];
    }
    int width = self.frame.size.width;
    int height = self.frame.size.height;
    int rigthRectWidth = _rightViewRect.size.width;
    int rigthRectHeight = _rightViewRect.size.height;
    return CGRectMake(width-rigthRectWidth, (height-rigthRectHeight)/2, rigthRectWidth, rigthRectHeight);
}

-(CGRect)textRectForBounds:(CGRect)bounds {
    CGRect rect = [super textRectForBounds:bounds];
    return UIEdgeInsetsInsetRect(rect, _textEdgeInsets);
}

-(CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect rect = [super textRectForBounds:bounds];
    return UIEdgeInsetsInsetRect(rect, _textEdgeInsets);
}

-(void)didMoveToSuperview {
    [super didMoveToSuperview];
    if(_pickerView) [self reloadPickerView];
    if(_actionSheet) [self reloadActionSheet];
}

#pragma mark --------------------public--------------------
-(instancetype)init {
    self = [super init];
    if (self) {
        _textEdgeInsets = UIEdgeInsetsZero;
        self.delegate = self;
        self.borderStyle = UITextBorderStyleNone;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.tfFont(@14).tfBgColor([UIColor whiteColor]);
    }
    return self;
}

+(instancetype)textField {
    KKBaseTextField* textFiled = [[KKBaseTextField alloc] init];
    return textFiled;
}

+(instancetype)textFieldWithPlaceholder:(NSString *)placeholder {
    KKBaseTextField* textFiled = [self textField];
    textFiled.tfPlaceholder(placeholder);
    return textFiled;
}

-(KKBaseTextField *(^)(CGRect ))tfFrame {
    return ^KKBaseTextField*(CGRect frame){
        self.frame = frame;
        return self;
    };
}

-(KKBaseTextField *(^)(NSString *))tfPlaceholder {
    return ^KKBaseTextField*(NSString* placeholder){
        self.placeholder = placeholder;
        return self;
    };
}

-(KKBaseTextField *(^)(UIColor *))tfPlaceholderColor {
    return ^KKBaseTextField*(UIColor* color){
        [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
        return self;
    };
}

-(KKBaseTextField *(^)(BOOL))tfSecureTextEntry {
    return ^KKBaseTextField*(BOOL secureTextEntry){
        self.secureTextEntry = secureTextEntry;
        return self;
    };
}

-(KKBaseTextField *(^)(UIKeyboardType))tfKeyboardType {
    return ^KKBaseTextField*(UIKeyboardType type){
        self.keyboardType = type;
        return self;
    };
}

-(KKBaseTextField *(^)(UIColor *))tfBgColor {
    return ^KKBaseTextField*(UIColor* color){
        self.backgroundColor = color;
        return self;
    };
}

-(KKBaseTextField *(^)(id))tfFont {
    return ^KKBaseTextField*(id font){
        self.font = [font isKindOfClass:[UIFont class]]?font:[UIFont systemFontOfSize:[font floatValue]];
        if ([self.leftView isKindOfClass:[KKBaseTextFieldLeftLabel class]]) {
            KKBaseTextFieldLeftLabel* leftView = (KKBaseTextFieldLeftLabel*)self.leftView;
            leftView.font = self.font;
        }
        return self;
    };
}

-(KKBaseTextField *(^)(UIColor *))tfTextColor {
    return ^KKBaseTextField*(UIColor* color){
        self.textColor = color;
        if ([self.leftView isKindOfClass:[KKBaseTextFieldLeftLabel class]]) {
            KKBaseTextFieldLeftLabel* leftView = (KKBaseTextFieldLeftLabel*)self.leftView;
            leftView.textColor = color;
        }
        return self;
    };
}

-(KKBaseTextField *(^)(UITextBorderStyle))tfBorderStyle {
    return ^KKBaseTextField*(UITextBorderStyle style){
        self.borderStyle = style;
        return self;
    };
}

-(KKBaseTextField *(^)(NSString *, CGSize, CGFloat))tfTitleLeftView {
    return ^KKBaseTextField*(NSString* title,CGSize size,CGFloat titlePadding){
        self.leftViewMode = UITextFieldViewModeAlways;
        UILabel* leftView = [KKBaseTextFieldLeftLabel leftLabelWithSize:size padding:titlePadding text:title];
        leftView.textColor = self.textColor;
        leftView.font = self.font;
        self.leftView = leftView;
        return self;
    };
}

-(KKBaseTextField *(^)(id, CGSize))tfImageLeftView {
    return ^KKBaseTextField*(id image,CGSize size){
        self.leftViewMode = UITextFieldViewModeAlways;
        self.leftView = [self imageForLeftOrRightView:image size:size];
        return self;
    };
}

-(KKBaseTextField *(^)(id, CGSize))tfImageRightView {
    return ^KKBaseTextField*(id image,CGSize size){
        _rightViewRect.size = size;
        self.rightViewMode = UITextFieldViewModeAlways;
        self.rightView = [self imageForLeftOrRightView:image size:size];;
        return self;
    };
}

-(KKBaseTextField *(^)(UIEdgeInsets))tfTextEdgeInsets {
    return ^KKBaseTextField*(UIEdgeInsets insets){
        _textEdgeInsets = insets;
        return self;
    };
}

-(KKBaseTextField *(^)(int))tfTextMaxLength {
    return ^KKBaseTextField*(int maxLength){
        _maxLength = maxLength;
        return self;
    };
}

-(KKBaseTextField *(^)())tfTextAutoSegment {
    return ^KKBaseTextField*(){
        _isAutoSegment = YES;
        if (_maxLength != 0) {
            _maxLength += _maxLength%DEFAULT_TEXT_MIN_LEN==0?_maxLength/DEFAULT_TEXT_MIN_LEN-1:_maxLength/DEFAULT_TEXT_MIN_LEN;
        }
        return self;
    };
}

-(KKBaseTextField *(^)())tfCreateToolbar {
    return ^KKBaseTextField*(){
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(textFieldDone)];
        toolBar.items = @[space, done];
        self.inputAccessoryView = toolBar;
        return self;
    };
}

-(KKBaseTextField *(^)())tfCreatePickerView {
    return ^KKBaseTextField*(){
        self.inputView = self.pickerView;
        return self;
    };
}

-(KKBaseTextField *(^)(NSString *,NSString *))tfCreateActionSheet {
    return ^KKBaseTextField*(NSString* title,NSString* cancelButtonTitle){
        _actionSheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        self.inputAccessoryView = _actionSheet;
        return self;
    };
}

-(KKBaseTextField *(^)(UIDatePickerMode, NSString *))tfCreateDatePicker {
    return ^KKBaseTextField*(UIDatePickerMode mode,NSString* formatter){
        self.datePickerView.datePickerMode = mode;
        [self.formatter setDateFormat:formatter];
        self.inputAccessoryView = self.datePickerView;
        return self;
    };
}

-(void)reloadPickerView {
    [self.pickerView reloadAllComponents];
}

-(void)reloadActionSheet {
    NSInteger buttons = [_baseTextFieldDataSource textFieldNumberOfButtonsInActionSheet:self];
    for (int i = 0; i < buttons; i++) {
        [_actionSheet addButtonWithTitle:[_baseTextFieldDataSource textFiled:self actionSheetTitleForIndex:i]];
    }
}

@end

