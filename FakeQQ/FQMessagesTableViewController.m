//
//  FQMessagesTableViewController.m
//  FakeQQ
//
//  Created by hualet on 14/6/7.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import "FQMessagesTableViewController.h"
#import "FQArrowButton.h"
#import "FQQuickBar.h"
#import "FQQuickBarItem.h"

@interface FQMessagesTableViewController ()

@end

@implementation FQMessagesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"消息";
    
    CGSize wholeViewFrameSize = self.view.frame.size;
    
    // Init Middle View, which is used as the container of the quick bar.
    _middleView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, wholeViewFrameSize.width, wholeViewFrameSize.height)];
    _middleView.clipsToBounds = YES;
    _middleView.enabled = NO;
    _middleView.backgroundColor = [UIColor clearColor];
    [_middleView addTarget:self action:@selector(middleViewClicked) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_middleView];
    
    // Customize Navigation Bar Appearences
    UISegmentedControl* messageCallsSeg = [[UISegmentedControl alloc] initWithItems:@[@"消息", @"通话"]];
    messageCallsSeg.selectedSegmentIndex = 0;
    self.navigationItem.titleView = messageCallsSeg;
    
    _arrowButton = [[FQArrowButton alloc] init];
    self.navigationItem.rightBarButtonItem = _arrowButton;
    self.navigationItem.rightBarButtonItem.target = self;
    self.navigationItem.rightBarButtonItem.action = @selector(arrowClicked);
    
    // Init Quick Bar
    _item1 = [[FQQuickBarItem alloc] initWithTitle:@"多人聊天" Image:[UIImage imageNamed:@"menu_icon_chat"]];
    _item2 = [[FQQuickBarItem alloc] initWithTitle:@"多人通话" Image:[UIImage imageNamed:@"menu_icon_groupaudio"]];
    _item3 = [[FQQuickBarItem alloc] initWithTitle:@"共享照片" Image:[UIImage imageNamed:@"menu_icon_camera"]];
    _item4 = [[FQQuickBarItem alloc] initWithTitle:@"扫一扫" Image:[UIImage imageNamed:@"menu_icon_QR"]];
    
    int barHeight = 80;
    _quickBar = [[FQQuickBar alloc] initWithFrame:CGRectMake(0, -barHeight, wholeViewFrameSize.width, barHeight)];
    _quickBar.items = @[_item1, _item2, _item3, _item4];
    _quickBar.delegate = self;
    [_middleView addSubview:_quickBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showQuickBar
{
    _middleView.enabled = YES;
    _middleView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = _quickBar.frame;
        _quickBar.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    }];
}

- (void)hideQuickBar
{
    _middleView.enabled = NO;
    _middleView.backgroundColor = [UIColor clearColor];
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = _quickBar.frame;
        _quickBar.frame = CGRectMake(0, -rect.size.height, rect.size.width, rect.size.height);
    }];
}

#pragma mark - Actions

- (void)arrowClicked
{
    _arrowButton.arrowUp = !_arrowButton.arrowUp;
    _arrowButton.arrowUp ? [self showQuickBar] : [self hideQuickBar];
}

- (void)middleViewClicked
{
    [self hideQuickBar];
    _arrowButton.arrowUp = NO;
}

#pragma mark - FQQuickBarDelegate
- (void)quickBar:(FQQuickBar*)bar didClickItem:(FQQuickBarItem*)item
{
    [self hideQuickBar];
    _arrowButton.arrowUp = NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
