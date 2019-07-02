//
//  ZeroSDCSafety.h
//  ZeroSDCycleView
//
//  Created by ZeroSmile on 2017/9/7.
//  Copyright © 2017年 陈美安. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * NSArray
 */
@interface NSArray (ZeroSDCSafety)
- (id)SafetyObjectAtIndex:(NSUInteger)index;
@end

/*
 * NSMutableArray
 */
@interface NSMutableArray (ZeroSDCSafety)
- (BOOL)SafetyAddObject:(id)anObject;
- (BOOL)SafetyInsertObject:(id)anObject atIndex:(NSUInteger)index;
- (BOOL)SafetyRemoveObject:(id)anObject;
- (BOOL)SafetyRemoveObjectAtIndex:(NSUInteger)index;
- (BOOL)SafetyReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
@end

/*
 * NSMutableDictionary
 */
@interface NSMutableDictionary (ZeroSDCSafety)
- (void)SafetySetObject:(id)anObject forKey:(id <NSCopying>)aKey;
@end

@interface NSCalendar(ZeroSDCSafety)
- (NSDate *)safeDateFromComponents:(NSDateComponents *)comps;
- (NSDateComponents *)safeComponents:(NSCalendarUnit)unitFlags fromDate:(NSDate *)date;
@end
