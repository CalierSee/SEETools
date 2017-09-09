//
//  SEETagView.h
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SEETagView;

typedef NS_ENUM(NSUInteger, TageViewAnimationMode) {
    TageViewAnimationModeDefault,
    TageViewAnimationModeEasyInEasyOut,
    TageViewAnimationModeChangeWidth,
};

@protocol SEETagViewDelegate <NSObject>
@optional

/**
 选择某项的回调

 @param tagView self
 @param index 选中的下标
 */
- (void)tagView:(SEETagView *)tagView didSelectIndex:(NSInteger)index;

@end


@interface SEETagView : UIControl

/**
 当前选中按钮
 */
@property (nonatomic,assign,readonly)NSInteger currentTag;

/**
 构造方法

 @param titles 标题
 @return 实例
 */
- (instancetype)initWithTitles:(nullable NSArray <NSString *> *)titles;

/**
 构造方法
 
 @param titles 标题
 @return 实例
 */
- (instancetype)initWithAttributeTitles:(nullable NSArray <NSAttributedString *> *)titles;

/**
 配置title

 @param titles title
 */
- (void)configureWithTitles:(NSArray <NSString *> *)titles;

/**
 配置属性title

 @param titles title
 */
- (void)configureWithAttributeTitles:(NSArray <NSAttributedString *> *)titles;

//=============  配置UI  =============//

/**
 是否需要指示线
 */
@property (nonatomic,assign)BOOL needIndicator;
/**
 指示线颜色
 */
@property(nonatomic,strong)UIColor * indicatorColor;

/**
 配置title颜色

 @param color 颜色
 @param state 状态
 */
- (void)configureWithTitleColor:(UIColor *)color forState:(UIControlState)state;

/**
 设置选中动画模式

 @param mode 模式
 */
- (void)configureWithAnimationMode:(TageViewAnimationMode)mode;


//=============  op  =============//
- (void)selectAtIndex:(NSInteger)index;





- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
@end

NS_ASSUME_NONNULL_END
