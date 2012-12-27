//
//  JMAppDelegate.m
//  DrawingTest
//
//  Created by jonathan on 24/12/2012.
//  Copyright (c) 2012 foundry. All rights reserved.
//

#import "JMAppDelegate.h"
@interface JMAppDelegate()

 

@end

#define IMAGE1 @"h3_down"
#define IMAGE2 @"h3_up_green"

@implementation JMAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self initialise];
    
        // Insert code here to initialize your application
}

- (void) initialise
{
    self.rectToDrawIn1 = [[JMRect alloc] initWithRect:NSMakeRect(0, 0, 256, 256)];
    self.rectToDrawIn2 = [[JMRect alloc] initWithRect:NSMakeRect(256, 256, 256, 256)];

    self.rectToDrawFrom1 = [[JMRect alloc] initWithRect:NSMakeRect(0, 0, 512, 512)];
    self.rectToDrawFrom2 = [[JMRect alloc] initWithRect:NSMakeRect(0, 0, 512, 512)];
        //self.view.firstImage = [NSImage imageNamed:@"h_red"];
        //self.view.secondImage = [NSImage imageNamed:@"h_yellow"];
    self.view.firstImage = [NSImage imageNamed:IMAGE1];
    self.view.secondImage = [NSImage imageNamed:IMAGE2];
    
    [self crappyCode];
    
}

- (IBAction) reset:(id)sender
{
    [self initialise];
}

- (IBAction)firstAction:(id)sender {
    if (self.view.firstImage) {
        self.view.firstImage = nil;
        
    } else {
            //self.view.firstImage = [NSImage imageNamed:@"h_red"];
        self.view.firstImage = [NSImage imageNamed:IMAGE1];
    }
    [self.view setNeedsDisplay:YES];

}

- (IBAction)secondAction:(id)sender {
    if (self.view.secondImage) {
        self.view.secondImage = nil;
        
    } else {
            //self.view.secondImage = [NSImage imageNamed:@"h_yellow"];
        self.view.secondImage = [NSImage imageNamed:IMAGE2];
    }
    [self.view setNeedsDisplay:YES];
};

- (IBAction)mainAction:(id)sender {
    [self crappyCode];
}

- (IBAction)firstToggle:(NSSegmentedControl*)sender {
    if ([sender isSelectedForSegment:0])
        {
        self.view.firstImage = nil;

        }
    else {
            //self.view.firstImage = [NSImage imageNamed:@"h_red"];
        self.view.firstImage = [NSImage imageNamed:IMAGE1];
    }
    [self crappyCode];

    [self.view setNeedsDisplay:YES];

}

- (IBAction)secondToggle:(id)sender {
    if ([sender isSelectedForSegment:0])
        {
        self.view.secondImage = nil;

        }
    else {
            //self.view.secondImage = [NSImage imageNamed:@"h_yellow"];
        self.view.secondImage = [NSImage imageNamed:IMAGE2];

    }
    [self crappyCode];
    [self.view setNeedsDisplay:YES];

}

- (void) crappyCode {
    NSRect rectToDrawIn1 = [self.rectToDrawIn1 rect];
    NSRect rectToDrawFrom1 = [self.rectToDrawFrom1 rect];
    NSLog (@"self.rectToDrawIn1  %@",self.rectToDrawIn1 );
    NSLog (@"self.rectToDrawFrom1  %@",self.rectToDrawFrom1 );
    
    
    NSRect rectToDrawIn2 = [self.rectToDrawIn2 rect];
    NSRect rectToDrawFrom2 = [self.rectToDrawFrom2 rect];
    NSLog (@"self.rectToDrawIn2  %@",self.rectToDrawIn2 );
    NSLog (@"self.rectToDrawFrom2  %@",self.rectToDrawFrom2 );

    
    NSImage *newImage;
    newImage = [[NSImage alloc] initWithSize:self.view.bounds.size];
    [newImage lockFocus];
    

    if (self.view.firstImage){
    [self.view.firstImage drawInRect:rectToDrawIn1
                 fromRect:rectToDrawFrom1
               operation:NSCompositeXOR
                 fraction:0.8];
    }
    
    if (self.view.secondImage){
    [self.view.secondImage drawInRect:rectToDrawIn2
                  fromRect:rectToDrawFrom2
                 operation:NSCompositePlusLighter
                  fraction:0.7];
    }
  
    
    [newImage unlockFocus];
    self.view.combinedImage = newImage;
        //self.view.secondImage = nil;
    [self.view setNeedsDisplay:YES];
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
