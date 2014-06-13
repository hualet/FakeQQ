//
//  FQQuickBarItem.h
//  FakeQQ
//
//  Created by hualet on 14/6/7.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FQQuickBar;

@interface FQQuickBarItem : UIButton 

@property (readwrite, nonatomic, assign) FQQuickBar* quickBar;
@property (readwrite, nonatomic, copy) NSString* title;
@property (readwrite, nonatomic, strong) UIImage* image;

- (id)initWithTitle:(NSString*)title Image:(UIImage*)image;

@end
