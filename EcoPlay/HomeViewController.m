//
//  ViewController.m
//  EcoPlay
//
//  Created by Henrique do Prado Linhares on 04/05/15.
//  Copyright (c) 2015 Henrique do Prado Linhares. All rights reserved.
//

#import "HomeViewController.h"
#import "Game1ViewController.h"

@interface HomeViewController ()

@end





@implementation HomeViewController


- (IBAction)playButton:(id)sender {
    
    Game1ViewController * vc = [[Game1ViewController alloc]init];
    
    [self presentViewController:vc animated:YES completion:nil];

}





- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homeBackground"]] ;
//    
//
//    
//    [self.view addSubview:backgroundView] ;
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"inicial.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
}

- (void)viewDidAppear:(BOOL)animated{


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
