//
//  YLOperationBottomView.m
//  ani_demo
//
//  Created by Wong on 2017/9/5.
//  Copyright © 2017年 com.wong.t.c.h. All rights reserved.
//

#import "YLOperationBottomView.h"
#import <pop/POP.h>



@implementation YLOperationBottomView

- (instancetype)init {
    
    
    if (self = [super init]) {
        self.backgroundColor = [UIColor cyanColor];
        self.frame = CGRectMake(0, SCREEN_H , SCREEN_W, 200);
       
        [self createSubView];
    }
    return self;
}

- (void)createSubView {

    UIButton *removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    removeBtn.frame = CGRectMake(0, 0, 30, 30);
    removeBtn.center = CGPointMake(SCREEN_W/2, 200);
    [removeBtn setImage:[UIImage imageNamed:@"remove"] forState:UIControlStateNormal];
    [removeBtn addTarget:self action:@selector(hid) forControlEvents:UIControlEventTouchUpInside];
    removeBtn.tag = 10000;
    [self addSubview:removeBtn];
    
    for (NSInteger i=0; i<4; i++) {
        
        UIButton *subBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat padding = (SCREEN_W - 240) / 5;

        subBtn.frame = CGRectMake(padding + (padding + 60) * i, 140, 60, 60);
        subBtn.tag = 1000 + i;
        if (i%2 == 0) {
            
            subBtn.backgroundColor = [UIColor orangeColor];

        } else {
        
            subBtn.backgroundColor = [UIColor greenColor];

        
        }
        
        [self addSubview:subBtn];
    }

}
- (void)hid {

    POPBasicAnimation *anBasic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    
    anBasic.toValue = @(self.center.y + 200);
    
    anBasic.beginTime = CACurrentMediaTime() + 0.0f;
    anBasic.duration = 0.1;
    
    __weak typeof(self) weakSelf = self;

    anBasic.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            
             [weakSelf removeFromSuperview];
            if (weakSelf.block) {
                weakSelf.block();
            }
        }
    };
    [self pop_addAnimation:anBasic forKey:@"position"];
    
}
- (void)doAnimate {

    
    POPBasicAnimation *anBasic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    
    anBasic.toValue = @(self.center.y - 200);
    
    anBasic.beginTime = CACurrentMediaTime() + 0.0f;
    anBasic.duration = 0.2;
    [self pop_addAnimation:anBasic forKey:@"position"];
    
    for (NSInteger i=0; i<4; i++) {
        
        UIView *view = [self viewWithTag:1000 + i];
        POPSpringAnimation *anSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        
        anSpring.toValue = @(view.center.y - 110);
        
        anSpring.beginTime = CACurrentMediaTime() + (0.05f * i);
        
        anSpring.springBounciness = 15.0f;
        [view pop_addAnimation:anSpring forKey:@"position"];
        
    }
    UIButton *btn = [self viewWithTag:10000];
    POPSpringAnimation *anSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    
    anSpring.toValue = @(btn.center.y - 35);
    
    anSpring.beginTime = CACurrentMediaTime() + 0.1;
    
    anSpring.springBounciness = 15.0f;
    [btn pop_addAnimation:anSpring forKey:@"position"];
    
}

@end
