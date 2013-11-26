//
//  APLSectionInfo.m
//  TVAnimationsGestures
//
//  Created by lanhu on 13-11-26.
//  Copyright (c) 2013年 lanhu. All rights reserved.
//

#import "APLSectionInfo.h"
#import "APLSectionHeaderView.h"
#import "APLPlay.h"


@implementation APLSectionInfo

- (id)init {
    self = [super init];
    if (self) {
        _rowHeights = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSInteger)countOfRowHeights {
    return [self.rowHeights count];
}

- (id)objectInRowHeightsAtIndex:(NSUInteger)index {
    return self.rowHeights[index];
}

- (void)insertObject:(id)object inRowHeightsAtIndex:(NSUInteger)index
{
    [self.rowHeights insertObject:object atIndex:index];
}

- (void)insertRowHeights:(NSArray *)array atIndexes:(NSIndexSet *)indexes
{
    [self.rowHeights insertObjects:array atIndexes:indexes];
}

- (void)removeObjectFromRowHeightsAtIndex:(NSUInteger)index {
    [self.rowHeights removeObjectAtIndex:index];
}

- (void)removeRowHeightsAtIndexes:(NSIndexSet *)indexes {
    [self.rowHeights removeObjectsAtIndexes:indexes];
}

- (void)replaceObjectInRowHeightsAtIndex:(NSUInteger)index withObject:(id)object {

    self.rowHeights[index] = object;
}

- (void)replaceRowHeightsAtIndexes:(NSIndexSet *)indexes withRowHeights:(NSArray *)array
{
    [self.rowHeights replaceObjectsAtIndexes:indexes withObjects:array];
}


@end
