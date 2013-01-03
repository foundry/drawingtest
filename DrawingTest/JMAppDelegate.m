//
//  JMAppDelegate.m
//  DrawingTest
//
//  Created by jwm on 24/12/2012.
//  Copyright (c) 2013 jwm / Foundry. All rights reserved.
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

    self.view.firstImage = [NSImage imageNamed:IMAGE1];
    self.view.secondImage = [NSImage imageNamed:IMAGE2];
    
    [self drawImages];
    
}

- (IBAction) reset:(id)sender
{
    [self initialise];
}


- (IBAction)mainAction:(id)sender {
    [self drawImages];
}

- (IBAction)firstToggle:(NSSegmentedControl*)sender {
    if ([sender isSelectedForSegment:0])
        {
        self.view.firstImage = nil;
        }
    else {
        self.view.firstImage = [NSImage imageNamed:IMAGE1];
    }
    [self drawImages];

    [self.view setNeedsDisplay:YES];

}

- (IBAction)secondToggle:(id)sender {
    if ([sender isSelectedForSegment:0])
        {
        self.view.secondImage = nil;
        }
    else {
        self.view.secondImage = [NSImage imageNamed:IMAGE2];
    }
    [self drawImages];
    [self.view setNeedsDisplay:YES];

}

- (void) drawImages {
    NSRect rectToDrawIn1 = [self.rectToDrawIn1 rect];
    NSRect rectToDrawFrom1 = [self.rectToDrawFrom1 rect];
    NSRect rectToDrawIn2 = [self.rectToDrawIn2 rect];
    NSRect rectToDrawFrom2 = [self.rectToDrawFrom2 rect];

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





@end
