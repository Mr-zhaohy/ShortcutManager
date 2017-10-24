//
//  ShortcutManager.h
//  3DTouchTest
//
//  Created by Mr_zhaohy on 2017/10/22.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_CLASS_AVAILABLE_IOS(9_0)
@interface ShortcutManager : NSObject

/**
 初始化对象

 @return 实例
 */
+(instancetype)shared;

/**
 添加/修改item

 @param title 标题
 @param desc 副标题
 @param iconName icon
 @param key 关键字（不可重复，如重复则覆盖）
 */
-(void)addShortcutItemWithTitle:(NSString *)title desc:(NSString *)desc icon:(NSString *)iconName key:(NSString *)key;

/**
 根据item查找key

 @param item 条目
 @return 关键字
 */
-(NSString *)keyOfItem:(UIApplicationShortcutItem *)item;

/**
 根据key删除item

 @param key 关键字
 @return 结果
 */
-(BOOL)removeItemForKey:(NSString *)key;

/**
 删除所有item
 */
-(void)removeAllItems;

/**
 应用，保存
 */
-(void)apply;
@end
