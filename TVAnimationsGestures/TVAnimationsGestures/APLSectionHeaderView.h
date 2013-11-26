//
//  APLSectionHeaderView.h
//  TVAnimationsGestures
//
//  Created by lanhu on 13-11-25.
//  Copyright (c) 2013年 lanhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol SectionHeaderViewDelegate;

@interface APLSectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIButton *disclosureButton;
@property (nonatomic, weak) IBOutlet id <SectionHeaderViewDelegate>delegate;


@property (nonatomic) NSInteger section;

- (void)toggleOpenWithUserAction:(BOOL)userAction;

@end


#pragma mark -


@protocol SectionHeaderViewDelegate <NSObject>

@optional
- (void)sectionHeaderView:(APLSectionHeaderView *)sectionHeaderView sectionOpened:(NSInteger)section;
- (void)sectionHeaderView:(APLSectionHeaderView *)sectionHeaderView sectionClosed:(NSInteger)section;

@end
