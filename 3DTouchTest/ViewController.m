//
//  ViewController.m
//  3DTouchTest
//
//  Created by Mr_zhaohy on 2017/10/22.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Preview.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        self.sourceControls = [@[_btn,_imageView,_tableView,_label] mutableCopy];
        /** 注册当前view */
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(UIViewController *)previewingOfControl:(UIControl *)control indexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[UIViewController alloc]init];
    if (control == _btn) {
        vc.view.backgroundColor = [UIColor redColor];
        vc.actionItems = @[[UIPreviewAction actionWithTitle:@"图片" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        }]];
        return vc;
    }
    else if ([control isEqual:_imageView]){
        vc.view.backgroundColor = [UIColor blueColor];
        vc.actionItems = @[[UIPreviewAction actionWithTitle:@"按钮" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        }]];
        return vc;
    }
    else if ([control isEqual:_label]){
        vc.view.backgroundColor = [UIColor yellowColor];
        UIPreviewActionGroup *group = [UIPreviewActionGroup actionGroupWithTitle:@"点击展开" style:UIPreviewActionStyleDefault actions:@[[UIPreviewAction actionWithTitle:@"Label" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        }],[UIPreviewAction actionWithTitle:@"Label" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        }]]];
        vc.actionItems = @[group];
        return vc;
    }
    else if ([control isEqual:_tableView] && indexPath){
        vc.view.backgroundColor = [UIColor greenColor];
        vc.actionItems = @[[UIPreviewAction actionWithTitle:[NSString stringWithFormat:@"%ld,%ld",indexPath.section,indexPath.row] style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        }],[UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        }]];
        return vc;
    }
    return nil;
}
-(void)putviewingWithCommitViewController:(UIViewController *)viewControllerToCommit{
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld,%ld",indexPath.section,indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
