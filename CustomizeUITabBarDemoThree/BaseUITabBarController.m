
//
//  BaseUITabBarController.m
//  CustomizeUITabBarDemoThree
//
//  Created by ChenPan on 2019/4/22.
//  Copyright © 2019 ChenPan. All rights reserved.
//

#import "BaseUITabBarController.h"
#import "MyTabBar.h"

#define ARC4COLOR [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@interface BaseUITabBarController ()<MyTabBarDelegate>
@property (nonatomic, weak) MyTabBar *customTabBar;
@end

@implementation BaseUITabBarController

// 其实在调用init方法的时候, 系统内部会默认调用initWithNibName
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // 添加子控制器
        // 首页
        UIViewController *home = [[UIViewController alloc] init];
        [self addOneChildVc:home title:@"首页" imageName:@"tabbar_home_os7" selectedImageName:@"tabbar_home_selected_os7"];
        
        // 消息
        UIViewController *message = [[UIViewController alloc] init];
        [self addOneChildVc:message title:@"消息" imageName:@"tabbar_message_center_os7" selectedImageName:@"tabbar_message_center_selected_os7"];
        
        // 广场
        UIViewController *discover = [[UIViewController alloc] init];
        [self addOneChildVc:discover title:@"广场" imageName:@"tabbar_discover_os7" selectedImageName:@"tabbar_discover_selected_os7"];
        
        // 设置(我)
        UIViewController *profile = [[UIViewController alloc] init];
        [self addOneChildVc:profile title:@"我" imageName:@"tabbar_profile_os7" selectedImageName:@"tabbar_profile_selected_os7"];
    }
    return self;
}

/**
 *  添加一个子控制器
 *
 *  @param childVc           需要添加的子控制器
 *  @param title             需要调节自控制器的标题
 *  @param imageName         需要调节自控制器的默认状态的图片
 *  @param selectedImageName 需要调节自控制器的选中状态的图片
 */
- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置子控制器的属性
    childVc.view.backgroundColor = ARC4COLOR;
    childVc.title = title;

    UIImage *norImage = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [ UIImage imageNamed:selectedImageName];
    
    childVc.tabBarItem.image = norImage;
    
    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    // 2.将自控制器添加到tabbar控制器中
    [self addChildViewController:childVc];
    
    // 3.调用自定义tabBar的添加按钮方法, 创建一个与当前控制器对应的按钮
    [self.customTabBar addTabBarButton: childVc.tabBarItem];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 创建自定义tabBar
    MyTabBar *customTabBar = [[MyTabBar alloc] init];
    // 设置frame
    customTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
    // 设置代理
    customTabBar.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 遍历系统的tabbar移除不需要的控件
    for (UIView *subView in self.tabBar.subviews) {
        // UITabBarButton私有API, 普通开发者不能使用
        if ([subView isKindOfClass:[UIControl class]]) {
            // 判断如果子控件时UITabBarButton, 就删除
            [subView removeFromSuperview];
        }
    }
}

#pragma mark - IWTabBarD·elegate
- (void)tabBar:(MyTabBar *)tabBar selectedButtonfrom:(NSInteger)from to:(NSInteger)to
{
  
    NSLog(@"从第%ld控制器切换到第%ld控制器",(long)from,(long)to);
   
    // 切换控制器
    self.selectedIndex = to;

}
@end
