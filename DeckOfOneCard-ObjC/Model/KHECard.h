//
//  KHECard.h
//  DeckOfOneCard-ObjC
//
//  Created by Kaden Hendrickson on 5/21/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KHECard : NSObject

@property (nonatomic, copy)NSString *value;
@property (nonatomic, copy)NSString *suit;
@property (nonatomic, copy)NSString *imageUrl;

-(instancetype) initWithValue:(NSString *)value suit:(NSString *)suit andImageUrl:(NSString *)imageUrl;

-(instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
