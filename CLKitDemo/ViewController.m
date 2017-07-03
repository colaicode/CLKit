//
//  ViewController.m
//  CLKitDemo
//
//  Created by KaKa on 2017/2/24.
//  Copyright © 2017年 KaKa. All rights reserved.
//

#import "ViewController.h"
#import "ButtonDemoViewController.h"
#import "KKKit.h"
#import "Masonry.h"

#define CELL_INDETIFY               @"CellIndentify"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray*                 demoArray;
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.leftItem.hidden = YES;
    self.navigationBar.backgroundColor = [UIColor blackColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_INDETIFY];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker* maker){
        maker.left.width.bottom.equalTo(self.view);
        maker.top.equalTo(self.navigationBar.mas_bottom);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.demoArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_INDETIFY];
    cell.textLabel.text = self.demoArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* demoName = self.demoArray[indexPath.row];
    NSString* classString = [demoName stringByAppendingString:@"ViewController"];
    UIViewController* vc = [[NSClassFromString(classString) alloc] init];
    vc.title = demoName;
    vc.view.backgroundColor = [UIColor brownColor];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(NSArray *)demoArray {
    if (!_demoArray) {
        _demoArray = @[@"LabelDemo",@"ButtonDemo",@"TextFieldDemo",@"AlertDemo",@"ActionSheetDemo"];
    }
    return _demoArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
