//
//  JMView.m
//  DrawingTest
//
//  Created by jonathan on 24/12/2012.
//  Copyright (c) 2012 foundry. All rights reserved.
//

#import "JMView.h"

@implementation JMView

- (void) drawRect:(NSRect)dirtyRect
{

    if (self.combinedImage) {
    [self.combinedImage drawInRect:self.bounds
                          fromRect:NSZeroRect
                         operation:NSCompositeSourceOver
                          fraction:1.0];
    }
    [NSColor blackColor];
    NSFrameRect(self.bounds);
}

@end
