//
//  FQQuickBarItem.m
//  FakeQQ
//
//  Created by hualet on 14/6/7.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import "FQQuickBarItem.h"
#import "FQQuickBar.h"

@implementation FQQuickBarItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addTarget:self action:@selector(informQuickBarAboutClickEvent) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

- (id)initWithTitle:(NSString*)title Image:(UIImage*)image
{
    self = [self initWithFrame:CGRectMake(0, 0, 80, 80)];
    if (self) {
        _title = title;
        _image = image;
        
        UIFont* systemFont = [UIFont systemFontOfSize:10];
        CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:systemFont}];
        self.titleLabel.font = systemFont;
        [self setImage:_image forState:UIControlStateNormal];
        [self setImageEdgeInsets:UIEdgeInsetsMake(-(self.frame.size.height - _image.size.height) / 2, 0, (self.frame.size.height - _image.size.height) / 2, -titleSize.width)];
        [self setTitle:_title forState:UIControlStateNormal];
        self.titleLabel.textColor = [UIColor redColor];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(_image.size.height - self.frame.size.height / 2 + titleSize.height / 2, -_image.size.width, 0, 0)];
    }
    return self;
}

- (void)informQuickBarAboutClickEvent
{
    [self.quickBar itemClicked:self];
}

@end
