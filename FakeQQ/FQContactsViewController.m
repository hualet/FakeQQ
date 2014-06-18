//
//  FQContactsViewController.m
//  FakeQQ
//
//  Created by hualet on 14/6/7.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import "FQContactsViewController.h"
#import "FQChatBubbleView.h"

@interface FQContactsViewController ()

@end

@implementation FQContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FQChatBubbleView* bubble = [[FQChatBubbleView alloc] initWithFrame:CGRectInset(self.view.frame, 50, 100)];
    [self.view addSubview:bubble];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - FQTabViewProtocol

- (void)initAssets
{
    UIImage* normalImage = [UIImage imageNamed:@"tab_buddy_nor"];
    UIImage* selectedImage = [UIImage imageNamed:@"tab_buddy_press"];
    [_tabBarItemContacts setImage:normalImage];
    [_tabBarItemContacts setSelectedImage:selectedImage];
}

@end
