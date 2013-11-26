//
//  APLQuoteCell.h
//  TVAnimationsGestures
//
//  Created by lanhu on 13-11-26.
//  Copyright (c) 2013年 lanhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class APLHighlightingTextView;
@class APLQuotation;

@interface APLQuoteCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *characterLabel;
@property (nonatomic, weak) IBOutlet UILabel *actAndSceneLabel;
@property (nonatomic, weak) IBOutlet APLHighlightingTextView *quotationTextView;

@property (nonatomic) APLQuotation *quotation;

@property (nonatomic) UILongPressGestureRecognizer *longPressRecognizer;

@end
