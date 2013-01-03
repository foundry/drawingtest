//
//  JMView.m
//  DrawingTest
//
//  Created by jwm on 24/12/2012.
//  Copyright (c) 2013 jwm / Foundry. All rights reserved.
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
