//
//  SHEtiquetteInfoViewCell.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHEtiquetteInfoViewCell.h"

@implementation SHEtiquetteInfoViewCell

- (void)refreshWithModel:(id<SHCommonModelProtocol>)model
{
    if ([model isKindOfClass:[Etiquette class]] == NO) {
        return;
    }
    
    self.model = model;
    
    
    
}

@end
