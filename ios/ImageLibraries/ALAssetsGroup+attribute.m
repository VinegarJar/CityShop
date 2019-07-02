//
//  ALAssetsGroup+XWExtend.m
//  ryp_rn_supplier
//
//  Created by 曾超 on 15/8/20.
//  Copyright (c) 2015年 小微软件. All rights reserved.
//

#import "ALAssetsGroup+attribute.h"

@implementation ALAssetsGroup (XWExtend)

- (NSURL *)url
{
    return [self valueForProperty:ALAssetsGroupPropertyURL];
}


- (NSString *)title
{
    return [self valueForProperty:ALAssetsGroupPropertyName];
}


@end
