//
//  ViewController.m
//  ani_demo
//
//  Created by Wong on 2017/9/5.
//  Copyright © 2017年 com.wong.t.c.h. All rights reserved.
//

#import "ViewController.h"
#import "YLOperationBottomView.h"
#import <pop/POP.h>

@interface ViewController ()
@property (nonatomic, strong) YLOperationBottomView *bottomView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popAction:(id)sender {
 
    
    [self.bottomView doAnimate];
    
    
}
- (YLOperationBottomView *)bottomView {

    if (!_bottomView) {
        _bottomView = [[YLOperationBottomView alloc] init];
        __weak typeof(self) weakSelf = self;
        _bottomView.block = ^{
            
            weakSelf.bottomView = nil;
        };
        [self.view addSubview:_bottomView];
    }

    return _bottomView;
}
@end
