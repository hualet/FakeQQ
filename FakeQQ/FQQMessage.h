//
//  FQQMessage.h
//  FakeQQ
//
//  Created by hualet on 14/6/8.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FQQMessage : NSObject

@property (nonatomic, readwrite, copy) NSString* message;

- (id)initWithMessage:(NSString*)message;

@end
