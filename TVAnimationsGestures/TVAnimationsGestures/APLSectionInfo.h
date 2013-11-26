//
//  APLSectionInfo.h
//  TVAnimationsGestures
//
//  Created by lanhu on 13-11-26.
//  Copyright (c) 2013年 lanhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APLSectionHeaderView;
@class APLPlay;

@interface APLSectionInfo : NSObject

@property (getter = isOpen) BOOL open;
@property APLPlay *play;
@property APLSectionHeaderView *headerView;

@property (nonatomic) NSMutableArray *rowHeights;

- (NSInteger)countOfRowHeights;
- (id)objectInRowHeightsAtIndex:(NSUInteger)index;
- (void)insertObject:(id)object inRowHeightsAtIndex:(NSUInteger)index;
- (void)removeObjectFromRowHeightsAtIndex:(NSUInteger)index;
- (void)replaceObjectInRowHeightsAtIndex:(NSUInteger)index withObject:(id)object;
- (void)insertRowHeights:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
- (void)removeRowHeightsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceRowHeightsAtIndexes:(NSIndexSet *)indexes withRowHeights:(NSArray *)array;

@end
