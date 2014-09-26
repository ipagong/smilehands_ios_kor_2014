//
//  SHMemberModel.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 26..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHMemberModel : NSObject <SHCommonModelProtocol>

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *role;
@property (nonatomic, strong) NSString *memberName;

@end
