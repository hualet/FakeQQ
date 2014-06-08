//
//  FQArrowButton.m
//  FakeQQ
//
//  Created by hualet on 14/6/7.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import "FQArrowButton.h"

@implementation FQArrowButton

- (id)init
{
    self = [super init];
    if (self) {
        _arrowDown = [UIImage imageNamed:@"menu_icon_bulb"];
        _arrowUp = [UIImage imageNamed:@"menu_icon_bulb_pressed"];
        
        self.image = _arrowDown;
    }
    return self;
}

- (BOOL)arrowUp
{
    return self.image == _arrowUp;
}

- (void)setArrowUp:(BOOL)arrowUp
{
    self.image = arrowUp ? _arrowUp : _arrowDown;
}

@end
