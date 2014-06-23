//
//  FQChatViewTableViewController.h
//  FakeQQ
//
//  Created by hualet on 14/6/8.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FQChatViewTableViewController : UITableViewController

@property (nonatomic, readwrite, strong) NSMutableArray* messages;

@property (nonatomic, readwrite, strong) UIButton* voiceKeyboardButton;
@property (nonatomic, readwrite, strong) UIButton* emotionsButton;
@property (nonatomic, readwrite, strong) UIButton* addExtrasButton;
@property (nonatomic, readwrite, strong) UITextField* inputText;

@property (nonatomic, readwrite, strong) UIControl* hideActionControl;

@end
