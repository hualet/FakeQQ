//
//  FQQuickBar.h
//  FakeQQ
//
//  Created by hualet on 14/6/7.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FQQuickBarItem;
@class FQQuickBar;


@protocol FQQuickBarDelegate <NSObject>

@required
- (void)quickBar:(FQQuickBar*)bar didClickItem:(FQQuickBarItem*)item;

@end


@interface FQQuickBar : UIView

@property (readwrite, nonatomic, strong) NSArray* items;

@property (readwrite, nonatomic, assign) id<FQQuickBarDelegate> delegate;

- (void)itemClicked:(FQQuickBarItem *)item;

@end

