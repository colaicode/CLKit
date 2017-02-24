# CLKit
封装常用的控件
## KKBaseButton 
提供链式语法设置button属性。
demo1:

```
KKBaseButton* sender = [KKBaseButton buttonWithDefaultFont:@"Button"].normalTitleColor([UIColor blueColor]).normalImage(@"home_up").buttonFrame(CGRectMake(100, 100, 100, 40)).selectImage(@"home_down");
[sender upInsideAction:^(KKBaseButton* sender){
    sender.selected = !sender.selected;
}];
[self.view addSubview:sender];

```
demo2:

```
KKBaseButton* button = [KKBaseButton buttonWithImage:@"home_up" actionBlock:^(KKBaseButton* sender){
        sender.selected = !sender.selected;
}].buttonFrame(CGRectMake(100, 200, 100, 40)).selectImage(@"home_down");
[self.view addSubview:button];
```

## KKBaseLabel
demo:

```
KKBaseLabel* label = [KKBaseLabel subheadlineLable]
                         .labelTextColor([UIColor redColor])
                         .labelAlignment(NSTextAlignmentLeft)
                         .labelFrame(CGRectMake(100, 100, 100, 40))
                         .labelBgColor([UIColor darkTextColor])
                         .labelText(@"text");
[self.view addSubview:label];

```
## KKBaseAlertView
demo:

```
[KKBaseAlertView showAlert:@"alert" complete:^(NSInteger buttonIndex){
        NSLog(@"%ld",(long)buttonIndex);
}];
```
## KKBaseActionSheet
demo:

```
[KKBaseActionSheet showActionSheet:@"请选择性别" buttons:@[@"男",@"女"] complete:^(NSInteger buttonIndex){
        NSLog(@"%ld",(long)buttonIndex);
}];
```

## 安装
pod 'CLKit'

