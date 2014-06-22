//
//  FQChatBubbleView.h
//  FakeQQ
//
//  Created by hualet on 14-6-16.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FQChatBubbleView : UIView

@property (nonatomic, readwrite, strong) NSString* string;

- (id)initWithString:(NSString*) string;

@end
