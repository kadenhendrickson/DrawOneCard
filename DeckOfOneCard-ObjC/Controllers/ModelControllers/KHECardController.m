//
//  KHECardController.m
//  DeckOfOneCard-ObjC
//
//  Created by Kaden Hendrickson on 5/21/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

#import "KHECardController.h"

@implementation KHECardController

+ (void)fetchCardWithCompletion:(void (^)(KHECard * _Nullable))completion
{
    NSURL *url = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw/?count=1"];
    NSLog(@"%@", url);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (data) {
           NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            KHECard* card = [[KHECard alloc]initWithDictionary:jsonDictionary];
            completion(card);
            return;
        }
        completion(nil);
        return;
        
    }]resume];
}

+ (void)fetchImageWithUrlString:(NSString *)urlString andCompletion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if(data) {
            UIImage *cardImage = [UIImage imageWithData:data];
            completion(cardImage);
            return;
        }
        completion(nil);
        return;
    }] resume];
}


@end
