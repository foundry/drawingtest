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
- (void)drawRect1:(NSRect)dirtyRect
{
    if (self.firstImage && self.secondImage) {
        NSSize newSize = NSMakeSize(self.bounds.size.width/2,
                                    self.bounds.size.height/2);
        NSImage* resizedFirstImage = [self resizeImage:self.firstImage
                                      size:newSize];
        NSImage* resizedSecondImage = [self resizeImage:self.self.secondImage
                                                  size:newSize];
        [resizedFirstImage drawAtPoint:NSMakePoint(0, 0)
                            fromRect:NSZeroRect
                           operation:NSCompositeSourceOver
                            fraction:0.5];
        [resizedSecondImage drawAtPoint:NSMakePoint(self.bounds.size.width/2, self.bounds.size.height/2)
                            fromRect:NSZeroRect
                           operation:NSCompositeSourceOver
                            fraction:0.5];
        
    }
  else  if (self.firstImage)
       
       
       {
       NSInteger width = self.firstImage.pixelsWide;
       NSInteger height = self.firstImage.pixelsHigh;
       
       [self.firstImage drawInRect:self.bounds
                          fromRect:
        NSMakeRect(0, 0,
                   width/2,
                   height/2)
                    operation:NSCompositeSourceOver
                     fraction:1.0];
       
       }
    
    else if (self.secondImage)
        {
        [self.secondImage drawInRect:self.bounds
                           fromRect:NSZeroRect
                          operation:NSCompositeSourceOver
                           fraction:0.5];
        }
}


- (NSImage*) resizeImage:(NSImage*)sourceImage size:(NSSize)size
{
    
    NSRect targetFrame = NSMakeRect(0, 0, size.width, size.height);     // exists
    NSImage* targetImage = nil;
    NSImageRep *sourceImageRep =
    [sourceImage bestRepresentationForRect:targetFrame
                                   context:nil
                                     hints:nil];
    
    targetImage = [[NSImage alloc] initWithSize:size];
    
        //  NSGraphicsContext* context = [NSGraphicsContext currentContext];
    [targetImage lockFocus];
        // [context setImageInterpolation:NSImageInterpolationLow];
    [sourceImageRep drawInRect: targetFrame];
    [targetImage unlockFocus];
        // [NSGraphicsContext setCurrentContext:context];
    
    return targetImage;
    
}


@end
