//
//  FQStatusNotifications.m
//  FakeQQ
//
//  Created by hualet on 14-6-13.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import "FQStatusNotifications.h"

@interface FQStatusNotifications ()

@property (readonly, strong, nonatomic) UIButton* prompt;

@end

@implementation FQStatusNotifications

+ (instancetype) sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FQStatusNotifications alloc] init];
    });
    return sharedInstance;
}

+ (void) showWithNick:(NSString*)nick count:(NSInteger*)count
{
    FQStatusNotifications* notifications = [FQStatusNotifications sharedInstance];
    
    UIButton* prompt = notifications.prompt;
    prompt.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
    NSString* title = [[NSString alloc] initWithFormat:@"%@(%ld)", nick, count];
    UIImage* image = [UIImage imageNamed:@"prompt"];
    UIFont* systemFont = [UIFont systemFontOfSize:12];
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:systemFont}];
    prompt.titleLabel.font = systemFont;
    [prompt setImage:image forState:UIControlStateNormal];
    [prompt setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
    [prompt setTitle:title forState:UIControlStateNormal];
    [prompt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    notifications.hidden = NO;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.frame = [[UIApplication sharedApplication] statusBarFrame];
        self.windowLevel = UIWindowLevelStatusBar;
        self.backgroundColor = [UIColor clearColor];
        
        _prompt = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width * 2 / 3, 0, self.frame.size.width / 3, self.frame.size.height)];
        
        [self addSubview:_prompt];
    }
    return self;
}

-(void)dealloc
{
    _prompt = nil;
}

@end
