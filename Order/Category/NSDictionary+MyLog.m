//
//  NSDictionary+MyLog.m
//  Order
//
//  Created by 凯东源 on 16/11/16.
//  Copyright © 2016年 凯东源. All rights reserved.
//

#import "NSDictionary+MyLog.h"

@implementation NSDictionary (MyLog)

- (NSString *)descriptionWithLocale:(id)locale {
    
    NSArray *allKeys = [self allKeys];
    
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"{\n "];
    
    int i = 0;
    for (NSString *key in allKeys) {
        
        id value= self[key];
        
        [str appendFormat:@"\t \"%@\" : ",key];
        
        // 字典和数组的value不加""
        if([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSArray class]]) {
            [str appendFormat:@"%@",value];
        } else {
            [str appendFormat:@"\"%@\"",value];
        }
        
        // 不是最后一个value加,
        if(i != allKeys.count - 1) {
            [str appendString:@","];
        }
        [str appendString:@"\n"];
        
        i++;
    }
    
    [str appendString:@"}"];
    
    return str;
}

@end
