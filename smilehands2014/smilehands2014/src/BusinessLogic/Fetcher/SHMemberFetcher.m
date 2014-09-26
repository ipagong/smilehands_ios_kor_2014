//
//  SHMemberFetcher.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 26..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHMemberFetcher.h"
#import "SHMemberModel.h"

@implementation SHMemberFetcher


- (void)requestUpdate
{
    // do nothing..
}

- (void)requestData
{
    NSArray *memberList = @[
                            [self createMemberWithImage:@"leader"
                                                   role:LocalString(@"settings_member_pm")
                                                   name:@"문근재"]
                            ,[self createMemberWithImage:@"proposer"
                                                    role:LocalString(@"settings_member_idea")
                                                    name:@"김진희"]
                            ,[self createMemberWithImage:@"developer05"
                                                    role:LocalString(@"settings_member_ux")
                                                    name:@"김진석"]
                            ,[self createMemberWithImage:@"markup"
                                                    role:LocalString(@"settings_member_ft")
                                                    name:@"김지훈"]
                            ,[self createMemberWithImage:@"developer01"
                                                    role:LocalString(@"settings_member_dev")
                                                    name:@"김정현"]
                            ,[self createMemberWithImage:@"developer02"
                                                    role:LocalString(@"settings_member_dev")
                                                    name:@"박수완"]
                            ,[self createMemberWithImage:@"developer03"
                                                    role:LocalString(@"settings_member_dev")
                                                    name:@"이희덕"]
                            ,[self createMemberWithImage:@"developer04"
                                                    role:LocalString(@"settings_member_dev")
                                                    name:@"강민수"]
                            ,[self createMemberWithImage:@"developer05"
                                                    role:LocalString(@"settings_member_dev")
                                                    name:@"신필용"]
                            ,[self createMemberWithImage:@"designer01"
                                                    role:LocalString(@"settings_member_design")
                                                    name:@"김승준"]
                            ,[self createMemberWithImage:@"designer02"
                                                    role:LocalString(@"settings_member_design")
                                                    name:@"최성규"]
                            ,[self createMemberWithImage:@"designer03"
                                                    role:LocalString(@"settings_member_design")
                                                    name:@"이수현"]
                            ];
    
    
    [self.dataList setSection:0
                sectionObject:kEmptySectionData
                 sectionItems:memberList];
    
    [self sendFetcherResultType:SHFetcherResultTypeSuccess error:nil];
}

- (SHMemberModel *)createMemberWithImage:(NSString *)image
                                    role:(NSString *)role
                                    name:(NSString *)name
{
    SHMemberModel *model = [[SHMemberModel alloc] init];
    
    [model setImageName:image];
    [model setRole:role];
    [model setMemberName:name];
    
    return model;
}

- (void)requestMore
{
    [self requestData];
}

@end
