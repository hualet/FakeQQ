//
//  FQQuickBar.m
//  FakeQQ
//
//  Created by hualet on 14/6/7.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import "FQQuickBar.h"
#import "FQQuickBarItem.h"

@implementation FQQuickBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setItems:(NSArray *)items
{
    _items = items;
    int itemWidth = self.frame.size.width / _items.count;
    int itemHeight = self.frame.size.height;
    
    for (int i = 0; i < _items.count; i++) {
        FQQuickBarItem* item = _items[i];
        item.quickBar = self;
        item.frame = CGRectMake(itemWidth * i, 0, itemWidth, itemHeight);
        [self addSubview:item];
    }
}

- (void)itemClicked:(FQQuickBarItem *)item
{
    if (self.delegate) {
        [self.delegate quickBar:self didClickItem:item];
    }
}

@end
