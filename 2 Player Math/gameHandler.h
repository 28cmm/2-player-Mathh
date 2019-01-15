//
//  gameHandler.h
//  2 Player Math
//
//  Created by Yilei Huang on 2019-01-14.
//  Copyright © 2019 Joshua Fanng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
NS_ASSUME_NONNULL_BEGIN

@interface gameHandler : UIView
@property NSMutableArray <Player *> *playerList;
@property NSNumber *scoreHandler;

@property NSNumber *answer;
@property NSInteger currentIndex;
-(NSString*)question;

-(BOOL)checkQuestion:(NSString*)input;




@end

NS_ASSUME_NONNULL_END
