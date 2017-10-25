//
//  UIViewController+Preview.h
//  3DTouchTest
//
//  Created by Mr_zhaohy on 2017/10/24.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_CLASS_AVAILABLE_IOS(9_0)
@interface UIViewController (Preview)<UIViewControllerPreviewingDelegate>
/**
 设置可响应的控件
 */
@property(nonatomic,strong) NSMutableArray <UIControl *>*sourceControls;

/**
 当前相应的控件
 */
@property(nonatomic,strong,readonly) UIControl *currentControl;

/**
 当前索引
 */
@property(nonatomic,strong,readonly) UIControl *currentIndexPath;

/**
 自定操作
 */
@property(nonatomic,strong) NSArray <UIPreviewAction *> *actionItems;

/**
 轻按触发

 @param control 响应的控件
 @return 视图控制器VC
 */
-(UIViewController *)previewingOfControl:(UIControl *)control indexPath:(NSIndexPath *)indexPath;
/**
 重按触发
 
 @param viewControllerToCommit 已经弹出的视图控制器
 */
-(void)putviewingWithCommitViewController:(UIViewController *)viewControllerToCommit;

@end
