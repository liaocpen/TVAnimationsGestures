
//
//  APLTableViewController.h
//  TVAnimationsGestures
//
//  Created by lanhu on 13-11-25.
//  Copyright (c) 2013年 lanhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import "APLSectionHeaderView.h"


@interface APLTableViewController : UITableViewController <MFMailComposeViewControllerDelegate, SectionHeaderViewDelegate>


@property (nonatomic) NSArray *plays;
@end
