//
//  Game1ViewController.h
//
//
//  Created by Henrique do Prado Linhares on 22/01/15.
//
//


/*
 Arquivo de cabeçalho (header) do jogo EcoQuiz

 */



#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Game1ViewController : UIViewController <AVAudioPlayerDelegate>{
    AVAudioPlayer *sound;
    NSURL *soundFile;
}

@end
