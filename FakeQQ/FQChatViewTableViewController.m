//
//  FQChatViewControllerTableViewController.m
//  FakeQQ
//
//  Created by hualet on 14/6/8.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import "FQChatViewTableViewController.h"
#import "FQQMessage.h"
#import "FQChatBubbleView.h"


@implementation FQChatViewTableViewController {
    UIImage* _incomingBubbleImage;
    UIImage* _outgoingBubbleImage;
    UIEdgeInsets _contentInsets;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _contentInsets = UIEdgeInsetsMake(10, 22, 10, 20);
    _incomingBubbleImage = [[UIImage imageNamed:@"bubble_incoming"] resizableImageWithCapInsets: _contentInsets resizingMode: UIImageResizingModeStretch];
    _outgoingBubbleImage = [[UIImage imageNamed:@"bubble_outgoing"] resizableImageWithCapInsets: _contentInsets resizingMode:UIImageResizingModeStretch];
    
    self.messages = [NSMutableArray array];
    [self.messages addObject:[[FQQMessage alloc] initWithMessage:@"Hello, World! http://www.baidu.com I know nothing in the world that has as much power as a word. Sometimes I write one[QQ:qq_icon,width:20,height:20], and I look at it, until it begins to shine."]];
    [self.messages addObject:[[FQQMessage alloc] initWithMessage:@"Hello, World! http://www.baidu.com I know nothing in the world that has as much power as a word. Sometimes I write one[QQ:qq_icon,width:20,height:20], and I look at it, until it begins to shine."]];
    [self.messages addObject:[[FQQMessage alloc] initWithMessage:@"Hello, World! http://www.baidu.com I know nothing in the world that has as much power as a word. Sometimes I write one[QQ:qq_icon,width:20,height:20], and I look at it, until it begins to shine."]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_messages count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chat_bubble" forIndexPath:indexPath];
    
    FQQMessage* message = _messages[indexPath.row];
    
    UIImageView* backgroundImage = [[UIImageView alloc] initWithImage: _incomingBubbleImage];
    backgroundImage.frame = CGRectMake(0, 0, 200, 200);
    
    FQChatBubbleView* bubble = [[FQChatBubbleView alloc] initWithString:message.message];
    bubble.frame = UIEdgeInsetsInsetRect(backgroundImage.frame, _contentInsets);
    
    [backgroundImage addSubview:bubble];
    [cell.contentView addSubview:backgroundImage];
    
    return cell;
}

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
