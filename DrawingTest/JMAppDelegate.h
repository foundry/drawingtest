//
//  JMAppDelegate.h
//  DrawingTest
//
//  Created by jonathan on 24/12/2012.
//  Copyright (c) 2012 foundry. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JMView.h"
#import "JMRect.h"

@interface JMAppDelegate : NSObject <NSApplicationDelegate>



@property (nonatomic, strong) JMRect* rectToDrawIn1;
@property (nonatomic, strong) JMRect* rectToDrawFrom1;
@property (nonatomic, strong) JMRect* rectToDrawIn2;
@property (nonatomic, strong) JMRect* rectToDrawFrom2;
@property (weak) IBOutlet NSTextField *RectToDrawInLabel1;
@property (weak) IBOutlet NSTextField *RectToDrawInLabel2;
@property (weak) IBOutlet NSTextField *RectToDrawFromLabel1;
@property (weak) IBOutlet NSTextField *RectToDrawFromLabel2;

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet JMView *view;
- (IBAction)firstAction:(id)sender;
- (IBAction)secondAction:(id)sender;
- (IBAction)mainAction:(id)sender;
- (IBAction)firstToggle:(id)sender;
- (IBAction)secondToggle:(id)sender;
- (IBAction) reset:(id)sender;
@end
