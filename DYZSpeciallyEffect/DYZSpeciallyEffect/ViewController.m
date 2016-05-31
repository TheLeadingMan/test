//
//  ViewController.m
//  DYZSpeciallyEffect
//
//  Created by dyz on 16/5/16.
//  Copyright © 2016年 DYZ. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@end

@implementation ViewController


#pragma mark - --- lift cycle 生命周期 ---

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.去掉背景图片和底部线条
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    
    [self createTableView];
    [self createBackButton];
    
    
    
}
#pragma mark - --- delegate 视图委托 ---
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat width = CGRectGetWidth(self.view.frame);
    
    CGFloat offsetY = scrollView.contentInset.top + scrollView.contentOffset.y;
    CGFloat progress = offsetY / (width/2 - 20);
    CGFloat progressChange = offsetY / (width/2 - 64 - 44);
    NSLog(@"%s, %f, %f, %f", __FUNCTION__ ,progressChange, progress, offsetY);
    if (progress <= 0) {
        self.headerView.frame = CGRectMake(0, offsetY, width,  width/2 - offsetY) ;
        
        self.headerView.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    if (progressChange >= 1) {
        self.navigationView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:(progressChange - 1)];
        [self.leftButton setBackgroundImage:[UIImage imageNamed:@"backArrow"] forState:UIControlStateNormal];
        self.leftButton.alpha = (progressChange - 1);
    }else {
        self.navigationView.backgroundColor = [UIColor clearColor];
        [self.leftButton setBackgroundImage:[UIImage imageNamed:@"Back_Arrow"] forState:UIControlStateNormal];
        self.leftButton.alpha = 1;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell %ld", (long)indexPath.row];
    return cell;
}
#pragma mark - --- event response 事件相应 ---

#pragma mark - --- private methods 私有方法 ---

#pragma mark - --- getters and setters 属性 ---

- (void)createTableView
{
    
    CGFloat tableY = -64;
    

    CGFloat tableH = CGRectGetHeight([UIScreen mainScreen].bounds);
    CGFloat tableW = CGRectGetWidth([UIScreen mainScreen].bounds);
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, tableY, tableW, tableH-tableY) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    _headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, tableY, tableW, tableW/2)];
    _headerView.image  = [UIImage imageNamed:@"xianggang.jpg"];
    [_headerView.layer setMasksToBounds:YES];
    
    UIView *headView = [[UIView alloc]initWithFrame:_headerView.bounds];
    [headView addSubview:_headerView];
    tableView.tableHeaderView = headView;
    [self.view addSubview:tableView];
    

}


-(void)createBackButton
{
  CGFloat viewW = CGRectGetWidth([UIScreen mainScreen].bounds);
  self.navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, -20, viewW, 64)];
  [self.navigationController.navigationBar addSubview:self.navigationView];
    
  self.leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 13, 21)];
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftButton];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
