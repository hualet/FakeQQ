//
//  FQArrowButton.h
//  FakeQQ
//
//  Created by hualet on 14/6/7.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FQArrowButton : UIBarButtonItem {
    UIImage* _arrowDown;
    UIImage* _arrowUp;
}

@property (readwrite, nonatomic, assign) BOOL arrowUp;

@end
