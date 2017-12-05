//
//  ViewController.m
//  suofang
//
//  Created by LeoTai on 2017/12/5.
//  Copyright © 2017年 Xavier. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImg;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  
  CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
  animation.fromValue=[NSNumber numberWithFloat:1.2];
  animation.toValue=[NSNumber numberWithFloat:1];
  animation.duration=3.0;
  animation.autoreverses=NO;
  animation.repeatCount=0;
  animation.removedOnCompletion=NO;
  animation.fillMode=kCAFillModeForwards;
  [self.headerImg.layer addAnimation:animation forKey:@"zoom"];
  
  
}

- (void)viewDidLayoutSubviews
{
  [super viewDidLayoutSubviews];
//  self.headerImg.frame = CGRectMake(-37.5, -22.4, 450, 268.8);
  self.headerImg.frame = CGRectMake(0, 0, 375, 224);
  self.headerImg.contentMode = UIViewContentModeScaleAspectFill;

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  if (scrollView.contentOffset.y < 0) {
    CGRect frame = self.headerImg.frame;
    frame.size.width = (224.0 - scrollView.contentOffset.y) * (self.view.frame.size.width / 224.0);
    frame.size.height = 224.0 - scrollView.contentOffset.y;
    frame.origin.x = scrollView.contentOffset.y;
    frame.origin.y = scrollView.contentOffset.y;
    self.headerImg.frame = frame;
   
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
