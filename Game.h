//
//  Game.h
//  DoodleJump
//
//  Created by Michael on 5/07/2014.
//  Copyright (c) 2014 Michael Liu. All rights reserved.
//

#import <UIKit/UIKit.h>


float UpMovement;
float SideMovement;
float PlatformMoveDown;

int RandomPosition;
int Platform3SideMovement;
int Platform5SideMovement;
int ScoreNumber;
int HighScoreNumber;
int AddedScore;
int LevelNumber;

BOOL BallLeft;
BOOL BallRight;
BOOL StopSideMovement;

BOOL Platform1Used;
BOOL Platform2Used;
BOOL Platform3Used;
BOOL Platform4Used;
BOOL Platform5Used;

BOOL PlatformFall1Used;
BOOL PlatformFlyUsed;

@interface Game : UIViewController
{
    
    IBOutlet UIButton *Start;
    IBOutlet UIImageView *Ball;
    IBOutlet UIImageView *PlatformFall1;
    IBOutlet UIImageView *PlatformFly;
    IBOutlet UIImageView *PlatformShield;
    IBOutlet UIImageView *PlatformFake;
    IBOutlet UIImageView *Shield;
    IBOutlet UIImageView *Platform1;
    IBOutlet UIImageView *Platform2;
    IBOutlet UIImageView *Platform3;
    IBOutlet UIImageView *Platform4;
    IBOutlet UIImageView *Platform5;
    IBOutlet UILabel *Score;
    IBOutlet UILabel *Level;
    IBOutlet UILabel *GameOver;
    IBOutlet UILabel *FinalScore;
    IBOutlet UILabel *HighScore;
    IBOutlet UIButton *Exit;
    
    IBOutlet UILabel *Restart;
    
    
    NSTimer *Movement;
    
    
}

-(IBAction)StartGame:(id)sender;
-(void)Moving;
-(void)Bounce;
-(void)PlatformMovement;
-(void)PlatformFall;
-(void)Scoring;
-(void)GameOver;
-(void)NewGame;

@end
