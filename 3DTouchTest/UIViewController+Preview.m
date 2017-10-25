//
//  UIViewController+Preview.m
//  3DTouchTest
//
//  Created by Mr_zhaohy on 2017/10/24.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import "UIViewController+Preview.h"
#import <objc/runtime.h>

static char kAssociatedControlsKey;
static char kAssociatedCurentControlKey;
static char kAssociatedActionItemsKey;
static char kAssociatedCurrentIndexPathKey;

@implementation UIViewController (Preview)

-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    UIControl *control;
    NSIndexPath *indexPath;
    //查找正在响应的控件
    for (UIControl *tmpControl in self.sourceControls) {
        if (CGRectContainsPoint(tmpControl.frame, location)) {
            control = tmpControl;
            if ([tmpControl isKindOfClass:[UITableView class]]) {
                UITableView *tmpTableView = (UITableView *)tmpControl;
                CGPoint p = [tmpTableView convertPoint:location fromView:previewingContext.sourceView];
                /** 通过坐标获得当前cell的indexPath */
                indexPath = [tmpTableView indexPathForRowAtPoint:p];
            }
        }
    }
    
    objc_setAssociatedObject(self, &kAssociatedCurentControlKey, control, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &kAssociatedCurrentIndexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return [self previewingOfControl:control indexPath:indexPath];
}
-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    [self putviewingWithCommitViewController:viewControllerToCommit];
}

-(NSMutableArray<UIControl *> *)sourceControls{
    return objc_getAssociatedObject(self, &kAssociatedControlsKey);
}
-(void)setSourceControls:(NSMutableArray<UIControl *> *)sourceControls{
    objc_setAssociatedObject(self, &kAssociatedControlsKey, sourceControls, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIControl *)currentControl{
    return objc_getAssociatedObject(self, &kAssociatedCurentControlKey);
}
-(void)setCurrentControl:(UIControl *)currentControl{
    objc_setAssociatedObject(self, &kAssociatedCurentControlKey, currentControl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSIndexPath *)currentIndexPath{
    return objc_getAssociatedObject(self, &kAssociatedCurrentIndexPathKey);
}
-(void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, &kAssociatedCurrentIndexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSArray <UIPreviewAction *> *)actionItems{
    return objc_getAssociatedObject(self, &kAssociatedActionItemsKey);
}
-(void)setActionItems:(NSArray <UIPreviewAction *> *)actionItems{
    objc_setAssociatedObject(self, &kAssociatedActionItemsKey, actionItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    return self.actionItems;
}
-(UIViewController *)previewingOfControl:(UIControl *)control indexPath:(NSIndexPath *)indexPath{
    return nil;
}
-(void)putviewingWithCommitViewController:(UIViewController *)viewControllerToCommit{
    
}
@end
