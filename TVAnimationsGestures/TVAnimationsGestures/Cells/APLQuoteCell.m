//
//  APLQuoteCell.m
//  TVAnimationsGestures
//
//  Created by lanhu on 13-11-26.
//  Copyright (c) 2013年 lanhu. All rights reserved.
//

#import "APLQuoteCell.h"
#import "APLQuotation.h"
#import "APLHighlightingTextView.h"

@implementation APLQuoteCell

- (void)setQuotation:(APLQuotation *)newQuotation {
    if (_quotation != newQuotation) {
        _quotation = newQuotation;
        
        self.characterLabel.text = _quotation.character;
        self.actAndSceneLabel.text = [NSString stringWithFormat:@"Act %d, Scene %d",_quotation.act, _quotation.scene];
        self.quotationTextView.text = _quotation.quotation;
    }
}

-(void)setLongPressRecognizer:(UILongPressGestureRecognizer *)newLongPressRecognizer
{
    if (_longPressRecognizer != newLongPressRecognizer) {
        if (_longPressRecognizer != nil) {
            [self removeGestureRecognizer:_longPressRecognizer];
        }
        if (newLongPressRecognizer != nil) {
            [self addGestureRecognizer:newLongPressRecognizer];
        }
        _longPressRecognizer = newLongPressRecognizer;
    }
}

@end
