//
//  JMRect.h
//  DrawingTest
//
//  Created by jwm on 25/12/2012.
//  Copyright (c) 2013 jwm / Foundry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JMOrigin.h"
#import "JMSize.h"

@interface JMRect : NSObject

@property (nonatomic, strong) JMOrigin* origin;
@property (nonatomic, strong) JMSize* size;
@property (nonatomic, strong, readonly) NSString* description;
@property (assign) NSRect rect;

- (id) initWithRect:(NSRect) rect;


@end
