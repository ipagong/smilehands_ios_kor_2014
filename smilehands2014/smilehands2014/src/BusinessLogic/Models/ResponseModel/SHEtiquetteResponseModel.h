//
//  SHEtiquetteResponseModel.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHEtiquetteResponseModel : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) NSDictionary *metaInfo;

@property (nonatomic, strong) NSString *explain;
@property (nonatomic, strong) NSString *situation;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *majorId;
@property (nonatomic, strong) NSString *lastUpdate;
@property (nonatomic, strong) NSString *eId;
@property (nonatomic, strong) NSString *adminId;

@end
