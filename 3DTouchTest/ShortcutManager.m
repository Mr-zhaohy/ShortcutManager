//
//  ShortcutManager.m
//  3DTouchTest
//
//  Created by Mr_zhaohy on 2017/10/22.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import "ShortcutManager.h"

@interface ShortcutManager()
@property(nonatomic,strong) NSMutableArray <UIApplicationShortcutItem *>*items;
@end

@implementation ShortcutManager
+(instancetype)shared{
    static ShortcutManager *manager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[self alloc] init];
            [manager load];
        }
    });
    return manager;
}
-(void)addShortcutItemWithTitle:(NSString *)title desc:(NSString *)desc icon:(NSString *)iconName key:(NSString *)key{
    if (!_items) {
        _items = [NSMutableArray arrayWithCapacity:0];
    }
    //已存在，则删除（然后覆盖）
    for (UIApplicationShortcutItem *tmpItem in _items) {
        if ([tmpItem.type isEqualToString:key]) {
            [_items removeObject:tmpItem];
        }
    }
    
    UIApplicationShortcutItem *item = [[UIMutableApplicationShortcutItem alloc]initWithType:key localizedTitle:title localizedSubtitle:desc icon:[UIApplicationShortcutIcon iconWithTemplateImageName:iconName] userInfo:nil];
    [_items addObject:item];
}
-(BOOL)removeItemForKey:(NSString *)key{
    for (UIApplicationShortcutItem *tmpItem in _items) {
        if ([tmpItem.type isEqualToString:key]) {
            [_items removeObject:tmpItem];
            [self apply];
            return YES;
        }
    }
    return NO;
}
-(NSString *)keyOfItem:(UIApplicationShortcutItem *)item{
    return item.type;
}
-(void)removeAllItems{
    _items = [NSMutableArray arrayWithCapacity:0];
    [self apply];
}
-(void)apply{
    [[UIApplication sharedApplication] setShortcutItems:_items];
}
/**
 加载已保存的条目
 */
-(void)load{
    _items = [[UIApplication sharedApplication].shortcutItems mutableCopy];
}
@end
