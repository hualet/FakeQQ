//
//  FQMessagesTableViewController.h
//  FakeQQ
//
//  Created by hualet on 14/6/7.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQQuickBar.h"
@class FQArrowButton;

@interface FQMessagesTableViewController : UITableViewController <FQQuickBarDelegate> {
    FQArrowButton* _arrowButton;
    FQQuickBar* _quickBar;
    UIControl* _middleView;
    
    FQQuickBarItem* _item1;
    FQQuickBarItem* _item2;
    FQQuickBarItem* _item3;
    FQQuickBarItem* _item4;
}

@end
