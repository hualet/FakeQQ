//
//  FQStatusNotifications.h
//  FakeQQ
//
//  Created by hualet on 14-6-13.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FQStatusNotifications : UIWindow

+ (instancetype) sharedInstance;
+ (void) showWithNick:(NSString*)nick count:(NSInteger*)count;

@end
