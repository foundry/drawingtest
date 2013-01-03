//
//  JMView.h
//  DrawingTest
//
//  Created by jwm on 24/12/2012.
//  Copyright (c) 2013 jwm / Foundry. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JMView : NSView

@property (nonatomic,strong) NSImage* firstImage;

@property (nonatomic, strong) NSImage* secondImage;
@property (nonatomic,strong) NSImage* combinedImage;

@property (assign) NSRect rectToDrawIn1;
@property (assign) NSRect rectToDrawIn2;
@property (assign) NSRect rectToDrawFrom1;
@property (assign) NSRect rectToDrawFrom2;


@end
