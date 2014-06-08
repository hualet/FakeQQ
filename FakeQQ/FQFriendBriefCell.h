//
//  FQFriendBriefCell.h
//  FakeQQ
//
//  Created by hualet on 14/6/8.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FQFriendBriefCell : UITableViewCell

@property (readwrite, nonatomic, strong) IBOutlet UIImageView* friendAvatar;
@property (readwrite, nonatomic, strong) IBOutlet UILabel* friendNick;
@property (readwrite, nonatomic, strong) IBOutlet UILabel* friendPresent;

@end
