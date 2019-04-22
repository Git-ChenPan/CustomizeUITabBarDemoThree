//
//  MyTabBarButton.h
//  CustomizeUITabBarDemoThree
//
//  Created by ChenPan on 2019/4/22.
//  Copyright © 2019 ChenPan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTabBarButton : UIButton
/**
 *  数据模型
 */
@property (nonatomic, strong) UITabBarItem  *item;
@end

NS_ASSUME_NONNULL_END
