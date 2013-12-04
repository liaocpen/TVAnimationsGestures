//
//  APLHighlightingTextView.m
//  TVAnimationsGestures
//
//  Created by lanhu on 13-11-26.
//  Copyright (c) 2013年 lanhu. All rights reserved.
//

#import "APLHighlightingTextView.h"

@implementation APLHighlightingTextView

- (void)setHighlighted:(BOOL)highlighted {
    //根据highlighted 状态来调整 text 的颜色
    if (highlighted != _highlighted) {
        self.textColor = highlighted ? [UIColor whiteColor] : [UIColor blackColor];
        _highlighted = highlighted;
    }
}

@end
