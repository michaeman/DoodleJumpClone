//
//  Game.m
//  DoodleJump
//
//  Created by Michael on 5/07/2014.
//  Copyright (c) 2014 Michael Liu. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)GameOver{
    
    Ball.hidden = YES;
    Platform1.hidden = YES;
    Platform2.hidden = YES;
    Platform3.hidden = YES;
    Platform4.hidden = YES;
    Platform5.hidden = YES;
    
    PlatformFall1.hidden = YES;
    PlatformShield.hidden = YES;
    Shield.hidden = YES;
    PlatformFake.hidden = YES;
    
    Score.hidden = YES;
    
    GameOver.hidden = NO;
    Exit.hidden = NO;
    FinalScore.hidden = NO;
    Restart.hidden = NO;
    
    FinalScore.text = [NSString stringWithFormat:@"Final Score: %i",ScoreNumber];
    
    [Movement invalidate];
    
    if (ScoreNumber > HighScoreNumber)
    {
        HighScoreNumber = ScoreNumber;
        [[NSUserDefaults standardUserDefaults] setInteger:HighScoreNumber forKey:@"HighScoreSaved"];
        HighScore.hidden = NO;
    }
    
    [self performSelector:@selector(NewGame) withObject:nil afterDelay:5];
    
}

-(void)NewGame{
    
    Ball.hidden = NO;
    Ball.center = CGPointMake(160, 508);
    Ball.image = [UIImage imageNamed:@"BallClean.png"];
    
    Platform1.hidden = NO;
    Platform1.center = CGPointMake(160, 562);
    
    Score.hidden = NO;
    Score.text = [NSString stringWithFormat:@"Score: 0"];
//    Score.center = CGPointMake(160, 38);
//    
//    Level.center = CGPointMake(274, 38);
    
    Start.hidden = NO;
    Platform2.hidden = YES;
    Platform3.hidden = YES;
    Platform4.hidden = YES;
    Platform5.hidden = YES;
    
    PlatformFall1.hidden = YES;
    PlatformFly.hidden = YES;
    PlatformShield.hidden = YES;
    Shield.hidden = YES;
    PlatformFake.hidden = YES;
    
    GameOver.hidden = YES;
    FinalScore.hidden = YES;
    HighScore.hidden = YES;
    Exit.hidden = YES;
    Restart.hidden = YES;
    
    ScoreNumber = 0;
    AddedScore = 0;
    LevelNumber = 1;
    
    Platform1Used = NO;
    Platform2Used = NO;
    Platform3Used = NO;
    Platform4Used = NO;
    Platform5Used = NO;
    
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    UpMovement = 0;
    SideMovement = 0;

    
    
}

-(void)Scoring{
    
    ScoreNumber = ScoreNumber + AddedScore;
    AddedScore = AddedScore - 1;
    
    if (AddedScore < 0)
    {
        AddedScore = 0;
    }
    
    Score.text = [NSString stringWithFormat:@"Score: %i",ScoreNumber];
    Level.text = [NSString stringWithFormat:@"Level: %i",LevelNumber];
    
    if (ScoreNumber > 500 && ScoreNumber < 1000)
    {
        LevelNumber = 2;
    }
    
    if (ScoreNumber > 1000 && ScoreNumber < 2000)
    {
        LevelNumber = 3;
    }
    
    if (ScoreNumber > 2000 && ScoreNumber < 3000)
    {
        LevelNumber = 4;
    }
    
    if (ScoreNumber > 3000 && ScoreNumber < 4000)
    {
        LevelNumber = 5;
    }
    
    if (ScoreNumber > 4000)
    {
        LevelNumber = 6;
    }
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    if (point.x < 160)
    {
        BallLeft = YES;
    }
    else
    {
        BallRight = YES;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    BallLeft = NO;
    BallRight = NO;
    StopSideMovement = YES;
    
}


-(void)PlatformMovement{
    
    Platform1.center = CGPointMake(Platform1.center.x, Platform1.center.y + PlatformMoveDown);
    Platform2.center = CGPointMake(Platform2.center.x, Platform2.center.y + PlatformMoveDown);
    
    Platform3.center = CGPointMake(Platform3.center.x + Platform3SideMovement, Platform3.center.y + PlatformMoveDown);
    
    Platform4.center = CGPointMake(Platform4.center.x, Platform4.center.y + PlatformMoveDown);
    
    Platform5.center = CGPointMake(Platform5.center.x + Platform5SideMovement, Platform5.center.y + PlatformMoveDown);
    
    PlatformFall1.center = CGPointMake(PlatformFall1.center.x, PlatformFall1.center.y + PlatformMoveDown);
    
    Shield.center = CGPointMake(Shield.center.x, Shield.center.y + PlatformMoveDown);
    
    PlatformFake.center = CGPointMake(PlatformFake.center.x, PlatformFake.center.y + PlatformMoveDown);
    
    if (Platform3.center.x < 37)
    {
        switch (LevelNumber) {
            case 1:
                Platform3SideMovement = 2;
                break;
            case 2:
                Platform3SideMovement = 3;
                break;
            case 3:
                Platform3SideMovement = 4;
                break;
            case 4:
                Platform3SideMovement = 5;
                break;
            case 5:
                Platform3SideMovement = 6;
                break;
            case 6:
                Platform3SideMovement = 7;
                break;
            default:
                break;
        }
    }
    
    if (Platform3.center.x > 283)
    {
        switch (LevelNumber) {
            case 1:
                Platform3SideMovement = -2;
                break;
            case 2:
                Platform3SideMovement = -3;
                break;
            case 3:
                Platform3SideMovement = -4;
                break;
            case 4:
                Platform3SideMovement = -5;
                break;
            case 5:
                Platform3SideMovement = -6;
                break;
            case 6:
                Platform3SideMovement = -7;
                break;
            default:
                break;
        }
    }
    
    if (Platform5.center.x > 283)
    {
        switch (LevelNumber)
        {
            case 1:
                Platform5SideMovement = -2;
                break;
            case 2:
                Platform5SideMovement = -3;
                break;
            case 3:
                Platform5SideMovement = -4;
                break;
            case 4:
                Platform5SideMovement = -5;
                break;
            case 5:
                Platform5SideMovement = -6;
                break;
            case 6:
                Platform5SideMovement = -7;
                break;
            default:
                break;
        }
    }
    
    if (Platform5.center.x < 37)
    {
        switch (LevelNumber)
        {
            case 1:
                Platform5SideMovement = 2;
                break;
            case 2:
                Platform5SideMovement = 3;
                break;
            case 3:
                Platform5SideMovement = 4;
                break;
            case 4:
                Platform5SideMovement = 5;
                break;
            case 5:
                Platform5SideMovement = 6;
                break;
            case 6:
                Platform5SideMovement = 7;
                break;
            default:
                break;
        }
    }
    
    PlatformMoveDown = PlatformMoveDown - 0.1;
    
    if (PlatformMoveDown < 0)
    {
        PlatformMoveDown = 0;
    }
    
    if (Platform1.center.y > 575)
    {
        RandomPosition = arc4random()%248;
        RandomPosition = RandomPosition + 36;
        Platform1.center = CGPointMake(RandomPosition, -6);
        Platform1Used = NO;
    }
    if (Platform2.center.y > 575)
    {
        RandomPosition = arc4random()%248;
        RandomPosition = RandomPosition + 36;
        Platform2.center = CGPointMake(RandomPosition, -6);
        Platform2Used = NO;
    }
    if (Platform3.center.y > 575)
    {
        RandomPosition = arc4random()%248;
        RandomPosition = RandomPosition + 36;
        Platform3.center = CGPointMake(RandomPosition, -6);
        Platform3Used = NO;
    }
    if (Platform4.center.y > 575)
    {
        RandomPosition = arc4random()%248;
        RandomPosition = RandomPosition + 36;
        Platform4.center = CGPointMake(RandomPosition, -6);
        Platform4Used = NO;
    }
    if (Platform5.center.y > 575)
    {
        RandomPosition = arc4random()%248;
        RandomPosition = RandomPosition + 36;
        Platform5.center = CGPointMake(RandomPosition, -6);
        Platform5Used = NO;
    }
    
}


-(void)Bounce{
    
    Ball.animationImages = [NSArray arrayWithObjects:
                            [UIImage imageNamed:@"BallCleanBounce1.png"],
                            [UIImage imageNamed:@"BallCleanBounce2.png"],
                            [UIImage imageNamed:@"BallCleanBounce1.png"],
                            [UIImage imageNamed:@"BallClean.png"],nil];
    
    [Ball setAnimationRepeatCount:1];
    Ball.animationDuration = 0.2;
    [Ball startAnimating];
    
    if (Ball.center.y > 450)
    {
        UpMovement = 13;
    }
    else if (Ball.center.y > 350)
    {
        UpMovement = 10;
    }
    else if (Ball.center.y > 250)
    {
        UpMovement = 7;
    }
    
}

-(void)PlatformFall{
    
    if (Ball.center.y > 500)
    {
        PlatformMoveDown = 1;
    }
    else if (Ball.center.y > 450)
    {
        PlatformMoveDown = 2;
    }
    else if (Ball.center.y > 400)
    {
        PlatformMoveDown = 4;
    }
    else if (Ball.center.y > 300)
    {
        PlatformMoveDown = 5;
    }
    else if (Ball.center.y > 250)
    {
        PlatformMoveDown = 6;
    }
    
}

-(void)Moving{
    
    
    if (Ball.center.y > 580)
    {
        [self GameOver];
    }
    
    [self Scoring];
    
    if (Ball.center.y < 250)
    {
        Ball.center = CGPointMake(Ball.center.x, 250);
    }
    
    [self PlatformMovement];
    
    Ball.center = CGPointMake(Ball.center.x + SideMovement, Ball.center.y - UpMovement);
    
    if (CGRectIntersectsRect(Ball.frame, Shield.frame))
    {
        [self PlatformFall];
        AddedScore = 15;
        RandomPosition = arc4random()%248;
        RandomPosition = RandomPosition + 36;
        Shield.center = CGPointMake(RandomPosition, -10*(RandomPosition%3));

        PlatformShield.center = CGPointMake(PlatformShield.center.x, 562);
        PlatformShield.hidden = NO;
    }
    
    if(Shield.center.y > 575 && PlatformShield.center.y != 562)
    {
        RandomPosition = arc4random()%248;
        RandomPosition = RandomPosition + 36;
        Shield.center = CGPointMake(RandomPosition, -10*(RandomPosition%3));
    }
    
    if (CGRectIntersectsRect(Ball.frame, PlatformFake.frame))
    {
        [self PlatformFall];
        AddedScore = 15;
        RandomPosition = arc4random()%248;
        RandomPosition = RandomPosition + 36;
        PlatformFake.center = CGPointMake(RandomPosition, -10*(RandomPosition%3));
        
        PlatformFake.center = CGPointMake(PlatformFake.center.x, 650);
        PlatformFake.hidden = NO;
    }
    
    if(PlatformFake.center.y > 575)
    {
        RandomPosition = arc4random()%248;
        RandomPosition = RandomPosition + 36;
        PlatformFake.center = CGPointMake(RandomPosition, -10*(RandomPosition%3));
    }
    
    if ((CGRectIntersectsRect(Ball.frame, PlatformShield.frame)) && (UpMovement < -2)){
        [self Bounce];
        [self PlatformFall];
        Ball.center = CGPointMake(Ball.center.x, Ball.center.y - 100);
        PlatformShield.center = CGPointMake(PlatformShield.center.x, 650);
    }
    
//    if ((CGRectIntersectsRect(Ball.frame, PlatformFly.frame)) && (UpMovement < -2)){
//        [self Bounce];
//        [self PlatformFall];
//        AddedScore = 50;
//        Ball.center = CGPointMake(Ball.center.x, Ball.center.y - 350);
//    }
    
    if ((CGRectIntersectsRect(Ball.frame, PlatformFall1.frame)) && (UpMovement < -2)){
        [self Bounce];
        [self PlatformFall];
        AddedScore = 20;
        RandomPosition = arc4random()%248;
        RandomPosition = RandomPosition + 36;
        PlatformFall1.center = CGPointMake(RandomPosition, -10*(RandomPosition%3));
    }
    
    if (PlatformFall1.center.y > 575)
    {
        RandomPosition = arc4random()%248;
        RandomPosition = RandomPosition + 36;
        PlatformFall1.center = CGPointMake(RandomPosition, -10*(RandomPosition%3));
    }
    
    if ((CGRectIntersectsRect(Ball.frame, Platform1.frame)) && (UpMovement < -2)){
        [self Bounce];
        [self PlatformFall];
        if (Platform1Used == NO)
        {
            AddedScore = 10;
            Platform1Used = YES;
        }
    }
    
    if ((CGRectIntersectsRect(Ball.frame, Platform2.frame)) && (UpMovement < -2)){
        [self Bounce];
        [self PlatformFall];
        if (Platform2Used == NO)
        {
            AddedScore = 10;
            Platform2Used = YES;
        }
    }
    if ((CGRectIntersectsRect(Ball.frame, Platform3.frame)) && (UpMovement < -2)){
        [self Bounce];
        [self PlatformFall];
        if (Platform3Used == NO)
        {
            AddedScore = 10;
            Platform3Used = YES;
        }
    }
    if ((CGRectIntersectsRect(Ball.frame, Platform4.frame)) && (UpMovement < -2)){
        [self Bounce];
        [self PlatformFall];
        if (Platform4Used == NO)
        {
            AddedScore = 10;
            Platform4Used = YES;
        }
    }
    if ((CGRectIntersectsRect(Ball.frame, Platform5.frame)) && (UpMovement < -2)){
        [self Bounce];
        [self PlatformFall];
        if (Platform5Used == NO)
        {
            AddedScore = 10;
            Platform5Used = YES;
        }
    }
    
    
    UpMovement = UpMovement - 0.5;
    
    if (BallLeft == YES)
    {
        SideMovement = SideMovement - 0.3;
        if (SideMovement < -5)
        {
            SideMovement = -5;
        }
    }
    
    if (BallRight == YES)
    {
        SideMovement = SideMovement + 0.3;
        if(SideMovement > 5)
        {
            SideMovement = 5;
        }
    }
    
    if (StopSideMovement == YES && SideMovement > 0)
    {
        SideMovement = SideMovement - 0.1;
        if(SideMovement < 0)
        {
            SideMovement = 0;
            StopSideMovement = NO;
        }
    }
    
    if (StopSideMovement == YES && SideMovement < 0)
    {
        SideMovement = SideMovement + 0.1;
        if(SideMovement > 0)
        {
            SideMovement = 0;
            StopSideMovement = NO;
        }
    }
    
    if (Ball.center.x < -11)
    {
        Ball.center = CGPointMake(330, Ball.center.y);
    }
    
    if (Ball.center.x > 330)
    {
        Ball.center = CGPointMake(-11, Ball.center.y);
    }
    
}

-(IBAction)StartGame:(id)sender{
    
    Start.hidden = YES;
    UpMovement = -5;
    
    Movement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(Moving) userInfo:nil repeats:YES];
    
    Platform2.hidden = NO;
    Platform3.hidden = NO;
    Platform4.hidden = NO;
    Platform5.hidden = NO;
    
    
    
    RandomPosition = arc4random()%248;
    RandomPosition = RandomPosition + 36;
    Platform2.center = CGPointMake(RandomPosition, 448);
    
    RandomPosition = arc4random()%248;
    RandomPosition = RandomPosition + 36;
    Platform3.center = CGPointMake(RandomPosition, 336);
    
    RandomPosition = arc4random()%248;
    RandomPosition = RandomPosition + 36;
    Platform4.center = CGPointMake(RandomPosition, 224);
    
    RandomPosition = arc4random()%248;
    RandomPosition = RandomPosition + 36;
    Platform5.center = CGPointMake(RandomPosition, 112);
    
    PlatformShield.center = CGPointMake(PlatformShield.center.x, 650);
    
    PlatformFall1.hidden = NO;
    Shield.hidden = NO;
    PlatformFake.hidden = NO;
    
    
    RandomPosition = arc4random()%248;
    RandomPosition = RandomPosition + 36;
    PlatformFake.center = CGPointMake(RandomPosition, 294);
    
    
    RandomPosition = arc4random()%248;
    RandomPosition = RandomPosition + 36;
    Shield.center = CGPointMake(RandomPosition, 65);
    
//    PlatformFly.hidden = NO;
    
    RandomPosition = arc4random()%248;
    RandomPosition = RandomPosition + 36;
    PlatformFall1.center = CGPointMake(RandomPosition, 166);
    
    Platform3SideMovement = -2;
    Platform5SideMovement = 2;
    
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    Platform2.hidden = YES;
    Platform3.hidden = YES;
    Platform4.hidden = YES;
    Platform5.hidden = YES;
    
    PlatformFall1.hidden = YES;
    PlatformFly.hidden = YES;
    PlatformShield.hidden = YES;
    Shield.hidden = YES;
    PlatformFake.hidden = YES;
    
    GameOver.hidden = YES;
    FinalScore.hidden = YES;
    HighScore.hidden = YES;
    Exit.hidden = YES;
    Restart.hidden = YES;
    
    ScoreNumber = 0;
    AddedScore = 0;
    LevelNumber = 1;
    
    Platform1Used = NO;
    Platform2Used = NO;
    Platform3Used = NO;
    Platform4Used = NO;
    Platform5Used = NO;
    
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    UpMovement = 0;
    SideMovement = 0;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
