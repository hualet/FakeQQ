//
//  FQContactsViewController.h
//  FakeQQ
//
//  Created by hualet on 14/6/7.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQTabViewProtocol.h"

@interface FQContactsViewController : UINavigationController <FQTabViewProtocol>

@property (readwrite, nonatomic, weak) IBOutlet UITabBarItem* tabBarItemContacts;

@end
