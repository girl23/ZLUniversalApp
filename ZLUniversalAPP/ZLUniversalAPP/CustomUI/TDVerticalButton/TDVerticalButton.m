//
//  TDVerticalButton.m
//  Project
//
//  Created by youli on 2017/9/11.
//  Copyright © 2017年 youli. All rights reserved.
//

#import "TDVerticalButton.h"

@interface TDVerticalButton ()

@property (nonatomic, strong) XCBadgeButton *badgeButton;

@end

@implementation TDVerticalButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.badgeButton = [[XCBadgeButton alloc] init];
    self.badgeButton.titleLabel.font = Font(11);
    [self addSubview:self.badgeButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.imageView.center = Point(ViewWidth / 2.0, ViewHeight / 3);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.titleLabel.bounds = Rect(0, 0, ViewWidth, 21);
    self.titleLabel.center = Point(ViewWidth / 2.0, ViewHeight / 3 * 2.4);
    
    self.badgeButton.center = Point(self.imageView.frame.origin.x + self.imageView.bounds.size.width - 2, self.imageView.frame.origin.y + 2);
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = badgeValue;
    self.badgeButton.badgeValue = badgeValue;
}
@end
