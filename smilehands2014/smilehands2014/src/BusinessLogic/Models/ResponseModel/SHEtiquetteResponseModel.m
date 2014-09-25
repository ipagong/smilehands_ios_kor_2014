//
//  SHEtiquetteResponseModel.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHEtiquetteResponseModel.h"

@implementation SHEtiquetteResponseModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.metaInfo = dictionary;
        
        for (NSString *key in dictionary.allKeys) {
            
            @try {
                [self setValue:dictionary[key] forKey:key];
            }
            @catch (NSException *exception) {
                DLog(@"mapping error occured check. [key : %@][value : %@]", key, dictionary[key]);
            }
            
        }
    }
    return self;
}

@end
