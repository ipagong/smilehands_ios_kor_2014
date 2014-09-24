//
//  KindHandicap.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Etiquette;

@interface KindHandicap : NSManagedObject <SHCommonModelProtocol>

@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * majorId;
@property (nonatomic, retain) NSString * imagePath;
@property (nonatomic, retain) NSNumber * markDeleted;
@property (nonatomic, retain) NSString * reserved1;
@property (nonatomic, retain) NSString * reserved2;
@property (nonatomic, retain) NSSet *etiquette;

#pragma mark - predicate methods

+ (NSPredicate *)predicateExistHandicap;

#pragma mark - sortDescriptor

+ (NSString *)sortByCreateMajorId;

@end

@interface KindHandicap (CoreDataGeneratedAccessors)

- (void)addEtiquetteObject:(Etiquette *)value;
- (void)removeEtiquetteObject:(Etiquette *)value;
- (void)addEtiquette:(NSSet *)values;
- (void)removeEtiquette:(NSSet *)values;

@end
