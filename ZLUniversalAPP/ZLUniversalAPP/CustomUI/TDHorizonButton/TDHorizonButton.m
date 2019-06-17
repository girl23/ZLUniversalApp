//
//  TDHorizonButton.m
//  Project
//
//  Created by youli on 2017/9/11.
//  Copyright © 2017年 youli. All rights reserved.
//

#import "TDHorizonButton.h"

@implementation TDHorizonButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.titleLabel.center = Point((ViewWidth - self.imageView.bounds.size.width - 3) / 2.0, self.titleLabel.center.y);
    self.imageView.frame = Rect(self.titleLabel.frame.origin.x + self.titleLabel.bounds.size.width + 6,
                                CGRectGetMinY(self.imageView.frame),
                                CGRectGetWidth(self.imageView.bounds),
                                CGRectGetHeight(self.imageView.bounds));
}

@end
