//
//  ViewControllerThree.m
//  DYZSpeciallyEffect
//
//  Created by dyz on 16/5/17.
//  Copyright © 2016年 DYZ. All rights reserved.
//

#import "ViewControllerThree.h"

@interface ViewControllerThree ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@end

@implementation ViewControllerThree

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
    CGFloat progressChange = offsetY / (width/2 - 64*2);
    NSLog(@"%s, %f, %f, %f", __FUNCTION__ ,progressChange, progress, offsetY);
    if (progress <= 0) {
        self.headerView.frame = CGRectMake(0, offsetY, width,  width/2 - offsetY) ;
        
        self.headerView.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    if (progressChange >= 1) {
        
       
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.navigationView.frame = CGRectMake(0, -20, width, 64);
        } completion:^(BOOL finished){}];
        
       
    }else {
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
             self.navigationView.frame = CGRectMake(0, -84, width, 64);
            
        } completion:^(BOOL finished){}];
 
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
     self.navigationView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.85];
    [self.navigationController.navigationBar addSubview:self.navigationView];
    
    
    
    self.leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 13, 21)];
     [self.leftButton setBackgroundImage:[UIImage imageNamed:@"backArrow"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftButton];
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 44)];
    _titleLabel.text = @"香港";
    [_titleLabel sizeToFit];
    self.navigationItem.titleView = _titleLabel;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
