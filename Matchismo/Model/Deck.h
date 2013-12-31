//
//  Deck.h
//  Matchismo
//
//  Created by Mark Tareshawty on 12/30/13.
//  Copyright (c) 2013 Mark Tareshawty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
