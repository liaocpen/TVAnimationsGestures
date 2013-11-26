//
//  APLTableViewController.m
//  TVAnimationsGestures
//
//  Created by lanhu on 13-11-25.
//  Copyright (c) 2013年 lanhu. All rights reserved.
//

#import "APLTableViewController.h"
#import "APLPlay.h"
#import "APLSectionInfo.h"
#import "APLQuoteCell.h"


@interface APLEmailMenuItem : UIMenuItem

@property (nonatomic) NSIndexPath *indexPath;

@end

@implementation APLEmailMenuItem
@end


#pragma mark - APLTableViewController

static NSString *SectionHeaderViewIdentifier = @"SectionHeaderViewIdentifier";

@interface APLTableViewController ()

@property (nonatomic) NSMutableArray *sectionInfoArray;
@property (nonatomic) NSIndexPath *pinchedIndexPath;
@property (nonatomic) NSInteger openSectionIndex;
@property (nonatomic) CGFloat initialOinchHeight;

@property (nonatomic) IBOutlet APLSectionHeaderView *sectionHeaderView;

@property (nonatomic) NSInteger uniformRowHeight;
@end


#pragma mark - 

#define DEFAULT_ROW_HEIGHT 88
#define HEADER_HEIGHT 48


@implementation APLTableViewController
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIPinchGestureRecognizer *pinRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [self.tableView addGestureRecognizer:pinRecognizer];
    
    //设置默认值
    self.tableView.sectionFooterHeight = HEADER_HEIGHT;
    self.uniformRowHeight = DEFAULT_ROW_HEIGHT;
    self.openSectionIndex = NSNotFound;
    
    UINib *sectionHeaderNib = [UINib nibWithNibName:@"SectionHeaderView" bundle:nil];
    [self.tableView registerNib:sectionHeaderNib forHeaderFooterViewReuseIdentifier:SectionHeaderViewIdentifier];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ((self.sectionInfoArray == nil) || ([self.sectionInfoArray count] != [self numberOfSectionsInTableView:self.tableView])) {
        NSMutableArray *infoArray = [[NSMutableArray alloc] init];
        
        for (APLPlay *play in self.plays) {
            
            APLSectionInfo *sectionInfo = [[APLSectionInfo alloc] init];
            sectionInfo.play = play;
            sectionInfo.open = NO;
            
            NSNumber *defaultRowHeight = @(DEFAULT_ROW_HEIGHT);
            NSInteger countOfQuotations = [[sectionInfo.play quotations] count];
            for (NSInteger i = 0; i < countOfQuotations; i++) {
                [sectionInfo insertObject:defaultRowHeight inRowHeightsAtIndex:i];
            }
            [infoArray addObject:sectionInfo];
        }
        self.sectionInfoArray = infoArray;
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.plays count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    APLSectionInfo *sectionInfo = (self.sectionInfoArray)[section];
    NSInteger numStoriesInSection = [[sectionInfo.play quotations]  count];
    return sectionInfo.open ? numStoriesInSection : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *QuoteCellIdentifier = @"QuoteCellIdentifier";
    APLQuoteCell *cell = (APLQuoteCell *)[tableView dequeueReusableCellWithIdentifier:QuoteCellIdentifier];
    if ([MFMailComposeViewController canSendMail]) {
        if (cell.longPressRecognizer != nil) {
            UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
            cell.longPressRecognizer = longPressRecognizer;
        }
    }
    else {
        cell.longPressRecognizer = nil;
    }

    
    return cell;
}



@end
