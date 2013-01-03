//
//  JMRect.m
//  DrawingTest
//
//  Created by jwm on 25/12/2012.
//  Copyright (c) 2013 jwm / Foundry. All rights reserved.
//

#import "JMRect.h"
@implementation JMRect

- (id) initWithRect:(NSRect) rect
{
    if        (self = [super init]) {
        
             self.origin = [[JMOrigin alloc] init];
           self.origin.x = rect.origin.x;
           self.origin.y = rect.origin.y;
               self.size = [[JMSize alloc]init];
         self.size.width = rect.size.width;
        self.size.height = rect.size.height;
        
                           [self setRect:rect];
    }
    
    return self;
}

- (id) init
{
    return [self initWithRect:NSMakeRect(0, 0, 0, 0)];
}

- (NSString*) description
{
    return [NSString stringWithFormat:
            @"descr {(%.2f %.2f) (%.2f %.2f)}"
            , self.origin.x
            , self.origin.y
            , self.size.width
            , self.size.height];
}

- (NSRect) rect {;
    return NSMakeRect(self.origin.x, self.origin.y, self.size.width, self.size.height);
}

- (void) setRect: (NSRect) rect {
       self.origin.x = rect.origin.x;
       self.origin.y = rect.origin.y;
     self.size.width = rect.size.width;
    self.size.height = rect.size.height;
}

@end
