//
//  DaoClass.m
//  DaoTest
//
//  Created by Gopal.Vaid on 15/04/16.
//  Copyright © 2016 Gopal.Vaid. All rights reserved.
//

#import "DaoClass.h"

@implementation DaoClass
@synthesize categoryDescription,categoryID,categoryName,catgoryImageURL,catgoryRemainingItemCount;


- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.categoryDescription = [decoder decodeObjectForKey:@"categoryDescription"];
        self.categoryName = [decoder decodeObjectForKey:@"categoryName"];
        self.catgoryImageURL = [decoder decodeObjectForKey:@"catgoryImageURL"];
        self.catgoryRemainingItemCount = [decoder decodeObjectForKey:@"catgoryRemainingItemCount"];
        self.categoryID = [decoder decodeObjectForKey:@"categoryID"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.categoryDescription forKey:@"categoryDescription"];
    [encoder encodeObject:self.categoryName forKey:@"categoryName"];
    [encoder encodeObject:self.catgoryImageURL forKey:@"catgoryImageURL"];
    [encoder encodeObject:self.catgoryRemainingItemCount forKey:@"catgoryRemainingItemCount"];
    [encoder encodeObject:self.categoryID forKey:@"categoryID"];
}

- (id)copyWithZone:(NSZone *)zone
{
    DaoClass *copy= [[DaoClass alloc] init];
    
    copy.categoryDescription = [categoryDescription copyWithZone:zone];
    copy.categoryName = [categoryName copyWithZone:zone];
    copy.catgoryImageURL = [catgoryImageURL copyWithZone:zone];
    copy.catgoryRemainingItemCount = [catgoryRemainingItemCount copyWithZone:zone];
    copy.categoryID = [categoryID copyWithZone:zone];
    return copy;
}


- (instancetype) initWithCategory:(NSString*)Name withDescription:(NSString*)description withImageURL: (NSString*)imageURL withRemainingItemCount:(NSString*)remainingItemCount withcategoryID:(NSString*)categoryId{
    
    DaoClass *objData = [[DaoClass alloc] init];
    objData.categoryDescription = description;
    objData.categoryName = Name;
    objData.catgoryImageURL = imageURL;
    objData.catgoryRemainingItemCount = remainingItemCount;
    objData.categoryID = categoryId;
    
    return objData;
}


@end
