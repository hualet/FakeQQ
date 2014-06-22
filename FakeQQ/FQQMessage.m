//
//  FQQMessage.m
//  FakeQQ
//
//  Created by hualet on 14/6/8.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import "FQQMessage.h"

@implementation FQQMessage

-(id)initWithMessage:(NSString *)message
{
    self = [super init];
    if (self) {
        self.message = message;
    }
    return self;
}

@end
