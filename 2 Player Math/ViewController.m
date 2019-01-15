//
//  ViewController.m
//  2 Player Math
//
//  Created by Yilei Huang on 2019-01-14.
//  Copyright © 2019 Joshua Fanng. All rights reserved.
//

#import "ViewController.h"
#import "gameHandler.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *score1;
@property (weak, nonatomic) IBOutlet UILabel *score2;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UITextField *userInput;
//@property (weak, nonatomic) IBOutlet UITextField *rightOrWrong;
@property (weak, nonatomic) IBOutlet UILabel *rightOrWrong;
@property (weak, nonatomic) IBOutlet UIView *hiddenFinish;
@property (weak, nonatomic) IBOutlet UIView *mainView;

@property gameHandler *gamehandler;
@end

@implementation ViewController

- (IBAction)button0:(UIButton *)sender {
    self.userInput.text = [self.userInput.text stringByAppendingString:@"0"];
}
- (IBAction)button1:(id)sender {
    self.userInput.text =[self.userInput.text stringByAppendingString:@"1"];
}
- (IBAction)button2:(id)sender {
    self.userInput.text =[self.userInput.text stringByAppendingString:@"2"];
}
- (IBAction)button3:(id)sender {
    self.userInput.text =[self.userInput.text stringByAppendingString:@"3"];
}
- (IBAction)button4:(id)sender {
    self.userInput.text =[self.userInput.text stringByAppendingString:@"4"];
}
- (IBAction)button5:(id)sender {
    self.userInput.text =[self.userInput.text stringByAppendingString:@"5"];
}
- (IBAction)button6:(id)sender {
    self.userInput.text =[self.userInput.text stringByAppendingString:@"6"];
}
- (IBAction)button7:(id)sender {
    self.userInput.text =[self.userInput.text stringByAppendingString:@"7"];
}
- (IBAction)button8:(id)sender {
    self.userInput.text =[self.userInput.text stringByAppendingString:@"8"];
}
- (IBAction)button9:(id)sender {
    self.userInput.text =[self.userInput.text stringByAppendingString:@"9"];
}








- (IBAction)restartButton:(id)sender {
    [self viewDidLoad];
    _hiddenFinish.hidden = true;
    _mainView.hidden =false;
}

- (IBAction)enterButton:(id)sender {
    BOOL rightOrNot =[self.gamehandler checkQuestion:self.userInput.text];
    if(rightOrNot){
        self.rightOrWrong.alpha =1;
        self.rightOrWrong.text = @"right";
        self.rightOrWrong.textColor =[UIColor greenColor];
//        [UIView animateWithDuration:1 animations:^{
//            self.rightOrWrong.alpha = 0;
//        }];
        //_rightOrWrong.alpha=1;
        [UIView animateWithDuration:1 animations:^{
            self.rightOrWrong.alpha = 0;
        }];
        
    }else{
        self.rightOrWrong.alpha =1;
        _rightOrWrong.text = @"wrong";
        _rightOrWrong.textColor = [UIColor redColor];
        [UIView animateWithDuration:1 animations:^{
            self.rightOrWrong.alpha = 0;
        }];
        //_rightOrWrong.alpha=1;
    }
    self.question.text=[self.gamehandler question];
    self.score1.text = [NSString  stringWithFormat:@"Player1 score:%@",      self.gamehandler.playerList[0].score];
    self.score2.text = [NSString  stringWithFormat:@"Player2 score:%@",      self.gamehandler.playerList[1].score];
    if([self.gamehandler.playerList[1].score isEqual: @(0)] || [self.gamehandler.playerList[0].score isEqual: @0]){
        self.hiddenFinish.hidden = false;
        self.mainView.hidden =true;
    }
    self.userInput.text = @"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gamehandler = [gameHandler new];
    self.userInput.placeholder = @"enter answer";
    
    self.question.text=[self.gamehandler question];
    self.rightOrWrong.text = @"guessing";
    self.rightOrWrong.textColor =[UIColor lightGrayColor];
    self.score1.text = [NSString  stringWithFormat:@"Player1 score:%@",      self.gamehandler.playerList[0].score];
    self.score2.text = [NSString  stringWithFormat:@"Player2 score:%@",      self.gamehandler.playerList[1].score];
//    self.gamHand = 
    // Do any additional setup after loading the view, typically from a nib.
}




@end
