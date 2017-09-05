//
//  YLOperationBottomView.h
//  ani_demo
//
//  Created by Wong on 2017/9/5.
//  Copyright © 2017年 com.wong.t.c.h. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREEN_W     [UIScreen mainScreen].bounds.size.width
#define SCREEN_H     [UIScreen mainScreen].bounds.size.height

typedef void(^EndAniBlock)(void);
@interface YLOperationBottomView : UIView
- (void)doAnimate;
@property (nonatomic, copy) EndAniBlock block;
@end
