//
//  DaoClass.h
//  DaoTest
//
//  Created by Gopal.Vaid on 15/04/16.
//  Copyright © 2016 Gopal.Vaid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DaoClass : NSObject<NSCoding,NSCopying>

@property (nonatomic, strong) NSString  *categoryName;
@property (nonatomic, strong) NSString  *categoryDescription;
@property (nonatomic, strong) NSString  *catgoryImageURL;
@property (nonatomic, strong) NSString  *catgoryRemainingItemCount;
@property (nonatomic, strong) NSString  *categoryID;
@property (nonatomic, strong) NSMutableArray  *daoArray;

- (instancetype) initWithCategory:(NSString*)Name withDescription:(NSString*)description withImageURL: (NSString*)imageURL withRemainingItemCount:(NSString*)remainingItemCount withcategoryID:(NSString*)categoryId;

@end
