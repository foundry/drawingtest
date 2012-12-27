//
//  JMRect.h
//  DrawingTest
//
//  Created by jonathan on 25/12/2012.
//  Copyright (c) 2012 foundry. All rights reserved.
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
