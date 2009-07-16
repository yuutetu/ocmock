//---------------------------------------------------------------------------------------
//  $Id$
//  Copyright (c) 2009 by Mulle Kybernetik. See License file for details.
//---------------------------------------------------------------------------------------

#import "OCMIndirectReturnValueProvider.h"


@implementation OCMIndirectReturnValueProvider

- (id)initWithProvider:(id)aProvider andSelector:(SEL)aSelector
{
	[super initWithValue:nil];
	provider = [aProvider retain];
	selector = aSelector;
	return self;
}

- (void)dealloc
{
	[provider release];
	[super dealloc];
}

- (void)handleInvocation:(NSInvocation *)anInvocation
{
	// TODO: Should check signature and only provide invocation when it matches first argument
	returnValue = [[provider performSelector:selector withObject:anInvocation] retain];
	[super handleInvocation:anInvocation];
}

@end
