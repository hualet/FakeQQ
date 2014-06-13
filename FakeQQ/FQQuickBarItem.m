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
    self = [self initWithFrame:CGRectMake(0, 0, 80, 60)];
    if (self) {
        _title = title;
        _image = image;
        
        UIFont* systemFont = [UIFont systemFontOfSize:10];
        CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:systemFont}];
        self.titleLabel.font = systemFont;
        [self setImage:_image forState:UIControlStateNormal];
        [self setImageEdgeInsets:UIEdgeInsetsMake(-(self.frame.size.height - _image.size.height) / 2, 0, (self.frame.size.height - _image.size.height) / 2, -titleSize.width)];
        [self setTitle:_title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - titleSize.height) / 2, -_image.size.width, 0, 0)];
        
        self.layer.borderWidth = 1;
        self.layer.borderColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.1].CGColor;
    }
    return self;
}

- (void)informQuickBarAboutClickEvent
{
    [self.quickBar itemClicked:self];
}

@end
