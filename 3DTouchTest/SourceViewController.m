//
//  SourceViewController.m
//  3DTouchTest
//
//  Created by Mr_zhaohy on 2017/10/25.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import "SourceViewController.h"
#import "UIViewController+Preview.h"
@interface SourceViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@end

@implementation SourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)previewingWithViewController:(UIViewController *)vc{
    self.tipLabel.text = @"预览中";
    //可重写actionItems
//    self.actionItems = @[[UIPreviewAction actionWithTitle:@"点击进入" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
//        [vc.navigationController pushViewController:self animated:YES];
//        self.tipLabel.text = @"点击进入";
//    }]];
}
-(void)intoWithViewController:(UIViewController *)vc{
    self.tipLabel.text = @"按压进入";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
