__Drawing Test__

This is a little toy interface to test this NSImage method

	- (void)drawInRect:(NSRect)dstRect 
			  fromRect:(NSRect)srcRect 
			  operation:(NSCompositingOperation)op 
			  fraction:(CGFloat)delta

It provides slider controls to alter `dstRect` and `srcRect` interactively and view the effects immediately.	

Two source images are provided and the method is sent to each. 

The _drawing context_ is a new NSImage which combines the results. This image is then drawn in an NSView:

	- (void) drawRect:(NSRect)dirtyRect
	{
		[NSColor blackColor];
		NSFrameRect(self.bounds);
		if (self.combinedImage) {
			[self.combinedImage drawInRect:self.bounds
								  fromRect:NSZeroRect
								 operation:NSCompositeSourceOver
								  fraction:1.0];
		}
	}

