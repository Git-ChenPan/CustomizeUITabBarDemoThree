//
//  MyTabBar.h
//  CustomizeUITabBarDemoThree
//
//  Created by ChenPan on 2019/4/22.
//  Copyright © 2019 ChenPan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class MyTabBar;

@protocol MyTabBarDelegate <NSObject>

/**
 *  当自定义tabBar的按钮被点击之后的监听方法
 *
 *  @param tabBar 触发事件的控件
 *  @param from   上一次选中的按钮的tag
 *  @param to     当前选中按钮的tag
 */
- (void)tabBar:(MyTabBar *)tabBar selectedButtonfrom:(NSInteger)from to:(NSInteger)to;
@end

@interface MyTabBar : UIView
/**
 *  根据模型创建对应控制器的对应按钮
 *
 *  @param item 数据模型(图片/选中图片/标题)
 */
- (void)addTabBarButton:(UITabBarItem *)item;

@property (nonatomic, weak) id<MyTabBarDelegate>  delegate;
@end

NS_ASSUME_NONNULL_END
