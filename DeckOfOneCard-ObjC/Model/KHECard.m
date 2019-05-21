//
//  KHECard.m
//  DeckOfOneCard-ObjC
//
//  Created by Kaden Hendrickson on 5/21/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

#import "KHECard.h"

@implementation KHECard

- (instancetype)initWithValue:(NSString *)value suit:(NSString *)suit andImageUrl:(NSString *)imageUrl
{
    self = [super init];
    if (self) {
        _value = value;
        _suit = suit;
        _imageUrl = imageUrl;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSArray *cardsArray = dictionary[@"cards"];
    NSDictionary<NSString *,NSString *> *cardsDictionary = cardsArray[0];
    NSString *suitFromJson = cardsDictionary[@"suit"];
    NSString *valueFromJson = cardsDictionary[@"value"];
    NSString *imageUrlFromJson = cardsDictionary[@"image"];
    
    if(![valueFromJson isKindOfClass:[NSString class]] || ![suitFromJson isKindOfClass:[NSString class]] ||  ![imageUrlFromJson isKindOfClass:[NSString class]]){
        return nil;
    }
        return [self initWithValue:valueFromJson suit:suitFromJson andImageUrl:imageUrlFromJson];

}

@end
