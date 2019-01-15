//
//  gameHandler.m
//  2 Player Math
//
//  Created by Yilei Huang on 2019-01-14.
//  Copyright © 2019 Joshua Fanng. All rights reserved.
//

#import "gameHandler.h"

@implementation gameHandler
- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentIndex = 0;
        _playerList =[NSMutableArray new];
        Player *player = [Player new];
        player.name =@"player1";
        [_playerList addObject:player];
        Player *player1 = [Player new];
        player1.name =@"player2";
        [_playerList addObject:player1];
    }
    return self;
}

-(NSString*)question{
    int numberOne = (arc4random_uniform(20)+1);
     int numberTwo = (arc4random_uniform(20)+1);
    //NSArray *questionArray = @[@"addition",@"subtraction",@"mutiplication"];
    int randomOne =(arc4random_uniform(3));
    if(randomOne ==0){
        _answer = @(numberOne + numberTwo);
        
        return [NSString stringWithFormat:@"%@: %u + %u =?",_playerList[_currentIndex].name,numberOne,numberTwo];
    }else if(randomOne ==1){
        _answer = @(numberOne - numberTwo);
        
        return [NSString stringWithFormat:@"%@: %u - %u =?",_playerList[_currentIndex].name,numberOne,numberTwo];
    }else{
        _answer = @(numberOne * numberTwo);
        
        return [NSString stringWithFormat:@"%@: %u * %u =?",_playerList[_currentIndex].name,numberOne,numberTwo];
    }
    
}

-(BOOL)checkQuestion:(NSString*)input{
    if(input.intValue ==_answer.intValue){
        
        return YES;
    }else{
        _playerList[_currentIndex].score = @(_playerList[_currentIndex].score.intValue -1);
        if([_playerList[_currentIndex].score  isEqual: @0]){
            NSLog(@"gameOver");
        }
        if(_currentIndex ==1){
            _currentIndex = 0;
        }else{
            
            _currentIndex =1 ;
        }
        NSLog(@"wrong answer");
        return NO;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
