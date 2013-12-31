//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Mark Tareshawty on 12/30/13.
//  Copyright (c) 2013 Mark Tareshawty. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardGameViewController

- (Deck *)deck {
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",
                            self.flipCount];
    NSLog(@"Flipcount changed to %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    Card *card = [[self deck] drawRandomCard];
    
    if ([sender.currentTitle length]) {
        if (card) [[self deck] addCard:card];
 
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
 
        if (card) {
            [sender setTitle:card.contents
                    forState:UIControlStateNormal];
        } else {
            [sender setHidden:YES];
        }
    }
 
    self.flipCount++;
}

@end
