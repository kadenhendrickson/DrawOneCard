//
//  KHECardController.h
//  DeckOfOneCard-ObjC
//
//  Created by Kaden Hendrickson on 5/21/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KHECard.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface KHECardController : NSObject


+(void)fetchCardWithCompletion:(void (^) (KHECard *_Nullable))completion;

+(void)fetchImageWithUrlString:(NSString *)urlString andCompletion: (void (^) (UIImage *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
