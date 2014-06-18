//
//  FQChatBubbleView.m
//  FakeQQ
//
//  Created by hualet on 14-6-16.
//  Copyright (c) 2014年 Hualet. All rights reserved.
//

#import "FQChatBubbleView.h"
#import <CoreText/CoreText.h>

#define MY_ATTRIBUTE_NAME @"image_attribute"

#define REGEX_PATTERN_LINKS @"((https?|ftp):\\/\\/)(\\w|\\.)+(:[0-9]+)?(\\/|\\w|\\.|\\?|\\&)"
#define REGEX_PATTERN_IMGS @"\\[QQ:(.*?)(,width:([0-9]+))?(,height:([0-9]+))?\\]"

@implementation FQChatBubbleView

static void deallocCallback( void* ref ){
}
static CGFloat ascentCallback( void *ref ){
    NSDictionary* dict = (__bridge NSDictionary*)ref;
    return [[dict objectForKey:@"imageWidth"] floatValue];
}
static CGFloat descentCallback( void *ref ){
    return 0;
}
static CGFloat widthCallback( void* ref ){
    NSDictionary* dict = (__bridge NSDictionary*)ref;
    return [[dict objectForKey:@"imageHeight"] floatValue];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(CFMutableAttributedStringRef)processAttributedString:(CFMutableAttributedStringRef)string
{
    NSMutableAttributedString* str = (__bridge NSMutableAttributedString*)string;
    NSString* destString = str.mutableString;
    
    // links
    NSRegularExpression* exp = [NSRegularExpression regularExpressionWithPattern:REGEX_PATTERN_LINKS options:NSRegularExpressionCaseInsensitive error:NULL];
    [exp enumerateMatchesInString:destString options:0 range:NSMakeRange(0, destString.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        
        CFAttributedStringSetAttribute(string, CFRangeMake(result.range.location, result.range.length),
                                       kCTForegroundColorAttributeName, [UIColor blueColor].CGColor);
        int value = kCTUnderlineStyleThick;
        CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &value);
        CFAttributedStringSetAttribute(string, CFRangeMake(result.range.location, result.range.length), kCTUnderlineColorAttributeName, [UIColor blueColor].CGColor);
        CFAttributedStringSetAttribute(string, CFRangeMake(result.range.location, result.range.length), kCTUnderlineStyleAttributeName, num);
        CFRelease(num);
    }];
    
    // images
    exp = [NSRegularExpression regularExpressionWithPattern:REGEX_PATTERN_IMGS options:NSRegularExpressionCaseInsensitive error:NULL];
    [exp enumerateMatchesInString:destString options:0 range:NSMakeRange(0, destString.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        
        for (int i = 0; i < [result numberOfRanges]; i++) {
            NSLog(@"%d", i);
            NSLog(@"%@", [destString substringWithRange:[result rangeAtIndex:i]]);
        }
        
        NSString* imageName;
        NSInteger imageWidth;
        NSInteger imageHeight;
        
        imageName = [destString substringWithRange:[result rangeAtIndex:1]];
        imageWidth = result.numberOfRanges == 6 ? [[destString substringWithRange:[result rangeAtIndex:3]] intValue] : 20;
        imageHeight = result.numberOfRanges == 6 ? [[destString substringWithRange:[result rangeAtIndex:5]] intValue] : 20;
        
        NSDictionary* imageDict = [NSDictionary dictionaryWithObjectsAndKeys:imageName, @"imageName", [NSNumber numberWithInteger:imageWidth], @"imageWidth", [NSNumber numberWithInteger:imageHeight], @"imageHeight", nil];
        
        CTRunDelegateCallbacks imageCallbacks;
        imageCallbacks.version = kCTRunDelegateVersion1;
        imageCallbacks.dealloc = deallocCallback;
        imageCallbacks.getAscent = ascentCallback;
        imageCallbacks.getDescent = descentCallback;
        imageCallbacks.getWidth = widthCallback;
        CTRunDelegateRef runDelegate = CTRunDelegateCreate(&imageCallbacks, (__bridge void *)(imageDict));
        
        CFAttributedStringReplaceString(string, CFRangeMake(result.range.location, result.range.length), CFSTR(" "));
        CFAttributedStringSetAttribute(string, CFRangeMake(result.range.location, 1),
                                       (__bridge CFStringRef)MY_ATTRIBUTE_NAME, (__bridge CFStringRef)imageName);
        CFAttributedStringSetAttribute(string, CFRangeMake(result.range.location, 1), kCTRunDelegateAttributeName, runDelegate);
        CFRelease(runDelegate);
    }];
    
    return string;
}

-(void)drawRect:(CGRect)rect
{
    // Initialize a graphics context in iOS.
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, rect);
    [[UIColor whiteColor] set];
    CGContextFillPath(context);
    
    // Flip the context coordinates, in iOS only.
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // Set the text matrix.
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    
    // Create a path which bounds the area where you will be drawing text.
    // The path need not be rectangular.
    CGMutablePathRef path = CGPathCreateMutable();
    
    // In this simple example, initialize a rectangular path.
    CGRect bounds = CGRectMake(10.0, 10.0, 200.0, 200.0);
    CGPathAddRect(path, NULL, bounds );
    
    // Initialize a string.
    CFStringRef textString = CFSTR("Hello, World! http://www.baidu.com I know nothing in the world that has as much power as a word. Sometimes I write one[QQ:qq_icon,width:20,height:20], and I look at it, until it begins to shine.");
    
    // Create a mutable attributed string with a max length of 0.
    // The max length is a hint as to how much internal storage to reserve.
    // 0 means no hint.
    CFMutableAttributedStringRef attrString =
    CFAttributedStringCreateMutable(kCFAllocatorDefault, 0);
    
    // Copy the textString into the newly created attrString
    CFAttributedStringReplaceString (attrString, CFRangeMake(0, 0),
                                     textString);
    // Set the color of the first 12 chars to red.
    CFAttributedStringSetAttribute(attrString, CFRangeMake(0, CFAttributedStringGetLength(attrString)),
                                   kCTForegroundColorAttributeName, [UIColor blackColor].CGColor);
    
    [self processAttributedString:attrString];
    
    // Create the framesetter with the attributed string.
    CTFramesetterRef framesetter =
    CTFramesetterCreateWithAttributedString(attrString);
    CFRelease(attrString);
    
    // Create a frame.
    CTFrameRef _frame = CTFramesetterCreateFrame(framesetter,
                                                CFRangeMake(0, 0), path, NULL);
    
    // Draw the specified frame in the given context.
    CTFrameDraw(_frame, context);
    
    
    //获取画出来的内容的行数
    CFArrayRef lines = CTFrameGetLines(_frame);
    //获取每行的原点坐标
    CGPoint lineOrigins[CFArrayGetCount(lines)];
    CTFrameGetLineOrigins(_frame, CFRangeMake(0, 0), lineOrigins);
    for (int i = 0; i < CFArrayGetCount(lines); i++) {
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        CGFloat lineAscent;
        CGFloat lineDescent;
        CGFloat lineLeading;
        //获取每行的宽度和高度
        CTLineGetTypographicBounds(line, &lineAscent, &lineDescent, &lineLeading);
        //获取每个CTRun
        CFArrayRef runs = CTLineGetGlyphRuns(line);
        for (int j = 0; j < CFArrayGetCount(runs); j++) {
            CGFloat runAscent;
            CGFloat runDescent;
            CGPoint lineOrigin = lineOrigins[i];
            //获取每个CTRun
            CTRunRef run = CFArrayGetValueAtIndex(runs, j);
            NSDictionary* attributes = (NSDictionary*)CTRunGetAttributes(run);
            CGRect runRect;
            //调整CTRun的rect
            runRect.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0,0), &runAscent, &runDescent, NULL);
            
            runRect=CGRectMake(lineOrigin.x + CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL), lineOrigin.y - runDescent, runRect.size.width, runAscent + runDescent);
            
            NSString *imageName = [attributes objectForKey:MY_ATTRIBUTE_NAME];
            //图片渲染逻辑，把需要被图片替换的字符位置画上图片
            if (imageName) {
                UIImage *image = [UIImage imageNamed:imageName];
                if (image) {
                    CGRect imageDrawRect;
                    imageDrawRect.size = CGSizeMake(30, 30);
                    imageDrawRect.origin.x = runRect.origin.x + lineOrigin.x;
                    imageDrawRect.origin.y = lineOrigin.y;
                    CGContextDrawImage(context, imageDrawRect, image.CGImage);
                }
            }
        }
    }
    
    // Release the objects we used.
    CFRelease(_frame);
    CFRelease(path);
    CFRelease(framesetter);
}

@end
