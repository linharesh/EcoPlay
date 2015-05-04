//
//  Game1ViewController.m
//
//
//  Created by Henrique do Prado Linhares on 22/01/15.
//  //


/*
Arquivo principal (.m) do jogo EcoQuiz

*/

// Importação para o arquivo de cabeçalho (header) da mesma classe
#import "Game1ViewController.h"

#import "HomeViewController.h"


@interface Game1ViewController ()


//@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextView *question;
@property (weak, nonatomic) IBOutlet UIButton *button_A;
@property (weak, nonatomic) IBOutlet UIButton *button_B;
@property (weak, nonatomic) IBOutlet UIButton *button_C;
@property (weak, nonatomic) IBOutlet UIButton *button_D;
@property (weak, nonatomic) IBOutlet UILabel *yourPoints;
@property (weak, nonatomic) IBOutlet UIButton *NextGame;
@property (weak, nonatomic) IBOutlet UIImageView *goback_image;
@property (weak, nonatomic) IBOutlet UIButton *goback;
@property (weak, nonatomic) IBOutlet UIImageView *background_image;

@property (weak, nonatomic) IBOutlet UIImageView *BG;

@property int points;
@property BOOL Corrected;
@property int random;
@property BOOL soundIsOn;



@end

@implementation Game1ViewController


/*
 Método que retorna o usuário para a tela inicial
 É acionado pelo botão goback
 */
- (IBAction)goback:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HomeViewController *mainmenuvc = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    
    [self presentViewController:mainmenuvc animated:YES completion:nil];

    
//    HomeViewController *mainmenuvc = [[HomeViewController alloc]init];
//    
//    [self presentViewController:mainmenuvc animated:YES completion:nil];

}


/*
 Função responsável por definir qual será a pergunta da rodada
 */
- (void)SetQuestion {
    
    NSString *answer;
    
    // Variável de controle para só permitir que a questão seja corrigida uma vez
    self.Corrected=false;
    
    
    //Gera número random de 0 até 9, ou seja, escolhe qual a pergunta será feira
    self.random = arc4random_uniform(10);
    
    switch (self.random)
    {
        case 0:{ // Caso seja a pergunta de numero 0 ...
            answer=[NSString stringWithFormat:@"Which of these processes is part of water`s treatment?"];
            break;
        }
            
        case 1:{ // Caso seja a pergunta de numero 1 ...
            answer=[NSString stringWithFormat:@"How long does it take for a plastic bag to decompose in nature?"];
            break;
        }
            
        case 2:{ // Caso seja a pergunta de numero 2 ...
            answer=[NSString stringWithFormat:@"How long does it take for the aluminium to decompose in nature?"];
            break;
        }
          
        case 3:{ // Caso seja a pergunta de numero 3 ...
            answer=[NSString stringWithFormat:@"What is the amount of available sweet water on earth?"];
            break;
        }
            
        case 4:{
            answer=[NSString stringWithFormat:@"What is the name of the largest watershed in the world?"];
            break;
        }
            
        case 5:{
            answer=[NSString stringWithFormat:@"Which of the alternatives below is considered an effect of the pollution of the water?"];
            break;
        }
            
        case 6:{
            answer=[NSString stringWithFormat:@"What type of plastic cannot be recycled?"];
            break;
        }
            
        case 7:{
            answer=[NSString stringWithFormat:@"In the collection of recyclable materials, which is the color of the recycle bin for paper ?"];
            break;
        }
            
        case 8:{
            answer=[NSString stringWithFormat:@"In the collection of recyclable materials, which is the color of the recycle bin for wood?"];
            break;
        }
            
        case 9:{
            answer=[NSString stringWithFormat:@"What is the average amount of domestic sewage is dumped every day in the Guanabara`s bay?"];
            break;
        }
        case 10:{
            answer=[NSString stringWithFormat:@"What is it the Global Warming?"];
            break;
        }
        case 11:{
            answer=[NSString stringWithFormat:@"The burning of trash releases up to 27 heavy metals and gases in the atmosphere. This contributes to the formation of:"];
            break;
        }
        case 12:{
            answer=[NSString stringWithFormat:@"We define as sustainable energy:"];
            break;
        }
        case 13:{
            answer=[NSString stringWithFormat:@"The so-called 'green products' are:"];
            break;
        }
        case 14:{
            answer=[NSString stringWithFormat:@"What should be thought to smart cities?"];
            break;
        }
        case 15:{
            answer=[NSString stringWithFormat:@"In what year did recycling begin to be taken seriously?"];
            break;
        }
        case 16:{
            answer=[NSString stringWithFormat:@"A long time ago, which of the events below influenced  recycling?"];
            break;
        }
        case 17:{
            answer=[NSString stringWithFormat:@"What did the document 'Agenda 21', signed in 1922, predict?"];
            break;
        }
            
        case 18:{
            answer = [NSString stringWithFormat:@"What country consumes the most energy in the world?"];
            break;
        }
            
        case 19:{
            answer = [NSString stringWithFormat:@"Which of the following sources of energy is not renewable?"];
            break;
        }
            
        case 20:{
            answer = [NSString stringWithFormat:@"Approximately how much of global electricity is produced from renewable sources?"];
            break;
        }
            
    }
    
    //Campo de texto recebe a pergunta definida
    self.question.text = answer;
}

/*
 Método responsável por apresentar na tela as opções de resposta para a pergunta gerada pelo método -SetaQuestion
 */
- (void) SetAnswers{
    
    
    //Faz um switch do self.random já gerado pelo método -SetQuestion
    switch(self.random){
            
        case 0:{ //Se a pergunta foi de numero 0, entao apresenta as respectivas opções de resposta
            [self.button_A setTitle:@"Sterilization" forState:UIControlStateNormal];
            [self.button_B setTitle:@"Flocculation" forState:UIControlStateNormal];//correta
            [self.button_C setTitle:@"Combustion" forState:UIControlStateNormal];
            [self.button_D setTitle:@"Ionization" forState:UIControlStateNormal];
            break;
        }
            
        case 1:{ //Se a pergunta foi de numero 1, entao apresenta as respectivas opções de resposta
            [self.button_A setTitle:@"10 years" forState:UIControlStateNormal];
            [self.button_B setTitle:@"45 years" forState:UIControlStateNormal];
            [self.button_C setTitle:@"70 years" forState:UIControlStateNormal];
            [self.button_D setTitle:@"100 years" forState:UIControlStateNormal];//correta
            break;
        }
            
        case 2:{ //Se a pergunta foi de numero 2, entao apresenta as respectivas opções de resposta
            [self.button_A setTitle:@"100 years" forState:UIControlStateNormal];
            [self.button_B setTitle:@"250 years" forState:UIControlStateNormal];
            [self.button_C setTitle:@"500 years" forState:UIControlStateNormal];//Correta
            [self.button_D setTitle:@"720 years" forState:UIControlStateNormal];
            break;
        }
            
        case 3:{ //Se a pergunta foi de numero 3, entao apresenta as respectivas opções de resposta
            [self.button_A setTitle:@"1%" forState:UIControlStateNormal];
            [self.button_B setTitle:@"3%" forState:UIControlStateNormal];//correta
            [self.button_C setTitle:@"5%" forState:UIControlStateNormal];
            [self.button_D setTitle:@"7%" forState:UIControlStateNormal];
            break;
        }
        
        case 4:{
            [self.button_A setTitle:@"Amazon basin" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"Congo basin" forState:UIControlStateNormal];
            [self.button_C setTitle:@"Nile Basin" forState:UIControlStateNormal];
            [self.button_D setTitle:@"Mississippi basin" forState:UIControlStateNormal];
            break;
        }
            
        case 5:{
            [self.button_A setTitle:@"Irrigation" forState:UIControlStateNormal];
            [self.button_B setTitle:@"Slurry" forState:UIControlStateNormal];
            [self.button_C setTitle:@"Flowering" forState:UIControlStateNormal];//correta
            [self.button_D setTitle:@"Greenhouse Effect" forState:UIControlStateNormal];
            break;
        }
            
        case 6:{
            [self.button_A setTitle:@"Soft drink bottle" forState:UIControlStateNormal];
            [self.button_B setTitle:@"Yoghurt pot" forState:UIControlStateNormal];//correta
            [self.button_C setTitle:@"Bucket" forState:UIControlStateNormal];
            [self.button_D setTitle:@"Pipe" forState:UIControlStateNormal];
            break;
        }
            
        case 7:{
            [self.button_A setTitle:@"Red" forState:UIControlStateNormal];
            [self.button_B setTitle:@"Black" forState:UIControlStateNormal];
            [self.button_C setTitle:@"Green" forState:UIControlStateNormal];
            [self.button_D setTitle:@"Blue" forState:UIControlStateNormal];//Correta
            break;
        }
    
        case 8:{
            [self.button_A setTitle:@"White" forState:UIControlStateNormal];
            [self.button_B setTitle:@"Black" forState:UIControlStateNormal];//Correta
            [self.button_C setTitle:@"Brown" forState:UIControlStateNormal];
            [self.button_D setTitle:@"Yellow" forState:UIControlStateNormal];
            break;
        }
    
        case 9:{
            [self.button_A setTitle:@"400 tons" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"420 tons" forState:UIControlStateNormal];
            [self.button_C setTitle:@"450 tons" forState:UIControlStateNormal];
            [self.button_D setTitle:@"470 tons" forState:UIControlStateNormal];
            break;
        }
        case 10:{
            [self.button_A setTitle:@"Excessive waste of water" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"When the temperature decreases rapidly" forState:UIControlStateNormal];
            [self.button_C setTitle:@"Climatic phenomenon resulting from human natural causes" forState:UIControlStateNormal];
            [self.button_D setTitle:@"An effect caused by noise pollution" forState:UIControlStateNormal];
            break;
        }
        case 11:{
            [self.button_A setTitle:@"Storms" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"Acid rain" forState:UIControlStateNormal];
            [self.button_C setTitle:@"Burning forests" forState:UIControlStateNormal];
            [self.button_D setTitle:@"Earthquakes" forState:UIControlStateNormal];
            break;
        }
        case 12:{
            [self.button_A setTitle:@"When we decrease the expenditure of electric power" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"Energy generated by wind" forState:UIControlStateNormal];
            [self.button_C setTitle:@"" forState:UIControlStateNormal];
            [self.button_D setTitle:@"Energy that can be used without being harmful to the environment" forState:UIControlStateNormal];
            break;
        }
        case 13:{
            [self.button_A setTitle:@"Teas and plants in general" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"Produced with technology that is less aggressive to the environment" forState:UIControlStateNormal];
            [self.button_C setTitle:@"Light products" forState:UIControlStateNormal];
            [self.button_D setTitle:@"energy that is harmful to the environment" forState:UIControlStateNormal];
            break;
        }
        case 14:{
            [self.button_A setTitle:@"Selective collection" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"Increased pollution" forState:UIControlStateNormal];
            [self.button_C setTitle:@"Energy expenditure" forState:UIControlStateNormal];
            [self.button_D setTitle:@"Rivers pollution" forState:UIControlStateNormal];
            break;
        }
        case 15:{
            [self.button_A setTitle:@"1960" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"1970" forState:UIControlStateNormal];
            [self.button_C setTitle:@"1990" forState:UIControlStateNormal];
            [self.button_D setTitle:@"2000" forState:UIControlStateNormal];
            break;
        }
        case 16:{
            [self.button_A setTitle:@"First Oil Crisis" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"First World War" forState:UIControlStateNormal];
            [self.button_C setTitle:@"Second World War" forState:UIControlStateNormal];
            [self.button_D setTitle:@"The Chernobyl accident" forState:UIControlStateNormal];
            break;
        }
        case 17:{
            [self.button_A setTitle:@"Not using renewable energy" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"The end of fossil fuels usage" forState:UIControlStateNormal];
            [self.button_C setTitle:@"The benefits of renewable energy" forState:UIControlStateNormal];
            [self.button_D setTitle:@"Global strategies for sustainable development" forState:UIControlStateNormal];
            break;
        }
            
        case 18:{
            [self.button_A setTitle:@"Canada" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"China" forState:UIControlStateNormal];
            [self.button_C setTitle:@"The United States" forState:UIControlStateNormal];
            [self.button_D setTitle:@"Russia" forState:UIControlStateNormal];
            break;
        }
            
        case 19:{
            [self.button_A setTitle:@"Solar Power" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"Petroleum" forState:UIControlStateNormal];
            [self.button_C setTitle:@"Hydropower" forState:UIControlStateNormal];
            [self.button_D setTitle:@"Biomass" forState:UIControlStateNormal];
            break;
        }
            
        case 20:{
            [self.button_A setTitle:@"1%" forState:UIControlStateNormal];//Correta
            [self.button_B setTitle:@"5%" forState:UIControlStateNormal];
            [self.button_C setTitle:@"8%" forState:UIControlStateNormal];
            [self.button_D setTitle:@"20%" forState:UIControlStateNormal];
            break;
        }
    
    }
}




//Método viewDidLoad
// É executado quando a tela é carregada.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.soundIsOn = true;
    
    
    //Define a imagem de background
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"quizbackground.jpg"]];
   // _background_image.image = [UIImage imageNamed:(@"quizBackground")];
    
//    UIGraphicsBeginImageContext(self.view.frame.size);
//    [[UIImage imageNamed:@"quizBackground.png"] drawInRect:self.view.bounds];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
    _BG.image = [UIImage imageNamed:@"quizBackground"];
    
    _goback_image.image = [UIImage imageNamed:(@"back_button_3")];
    
    
    
    
    //Imprime os pontos do jogador
    self.yourPoints.text=[NSString stringWithFormat:@"Total points: %d",self.points];
    self.points=0;
    
    [self SetQuestion];
    [self SetAnswers];

    
    // Desabilita e esconde o botão de próximo jogo,
    // que só deve estar visível e habilitada após a correção da pergunta.
    self.NextGame.enabled=NO;
    self.NextGame.hidden=YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 Método que verifica se a opção que o usuário escolheu é a correta.
 */
- (void)givesFeedback:(NSString*)x {
    
    // Cria uma instância de um NSArray
    NSArray *feedback;
    
    
    
    // Atribui ao NSArray chamado de feedback um NSArray de Strings, em que cada String é uma letra.
    // Esta letra corresponde ao gabarito de cada pergunta
    // Exemplo:
    // feedback[0] == @"B"  significa que o gabarito da pergunta de numero 0 é a opção B
    // feedback[1] == @"D"  significa que o gabarito da pergunta de numero 1 é a opção D
    feedback = [NSArray arrayWithObjects: @"B", @"D", @"C", @"B",@"A",@"C",@"B",@"D",@"B",@"A", @"C", @"B", @"D",@"B", @"A", @"B", @"A", @"D", @"C", @"B", @"C", nil];
    
    
    // Verifica se a questão já foi corrigida.
    // Se ela já foi, a execução deste método é interrompida através da chamada "return"
    if (self.Corrected){
        return; // Interrompe a execução do método givesFeedback
    }
    
    
    if (x == feedback[self.random]){//Se acertou, então pinta de verde a resposta correta
        
        self.points = self.points + 100; // Aumenta em 100 a pontuação do jogador
        
        if ([x  isEqual: @"A"]){
            self.button_A.backgroundColor =[UIColor greenColor];
        } else if ([x  isEqual: @"B"]){
            self.button_B.backgroundColor =[UIColor greenColor];
        } else if ([x isEqual: @"C"]){
            self.button_C.backgroundColor =[UIColor greenColor];
        } else if ([x isEqual: @"D"]){
            self.button_D.backgroundColor =[UIColor greenColor];
        }
        
        
        
    
    } else { // Se errou, então pinta de vermelho a alternativa errada
        
        self.points = self.points - 50; // Diminui em 50 a pontuação do jogador
        

        if ([x  isEqual: @"A"]){
            self.button_A.backgroundColor =[UIColor redColor];
        } else if ([x  isEqual: @"B"]){
            self.button_B.backgroundColor =[UIColor redColor];
        } else if ([x isEqual: @"C"]){
            self.button_C.backgroundColor =[UIColor redColor];
        } else if ([x isEqual: @"D"]){
            self.button_D.backgroundColor =[UIColor redColor];
        }
        
        
        // Pinta de verde a alternativa correta
        if ([feedback[self.random]  isEqual: @"A"]){
            self.button_A.backgroundColor =[UIColor greenColor];
        } else if ([feedback[self.random]  isEqual: @"B"]){
            self.button_B.backgroundColor =[UIColor greenColor];
        } else if ([feedback[self.random] isEqual: @"C"]){
            self.button_C.backgroundColor =[UIColor greenColor];
        } else if ([feedback[self.random] isEqual: @"D"]){
            self.button_D.backgroundColor =[UIColor greenColor];
        }
        
        
    }
    
    // Atualiza o campo de texto que contém a pontuação do jogador
    self.yourPoints.text=[NSString stringWithFormat:@"Total points: %d",self.points];
    
    
    // Variável self.Corrected recebe true, o que indica que a
    // questão já foi corrigida e não permite que ela seja corrigida novamente
    self.Corrected = true;
    
    // Ativa e deixa visível o botão que permite ao usuário começar um novo jogo
    self.NextGame.enabled=YES;
    self.NextGame.hidden=NO;

}


// Botão que o usuário pressiona quando quer responder outra pergunta
- (IBAction)NextGame:(id)sender {
    
    // Remove as cores de fundo de todos os botões
    self.button_A.backgroundColor =nil;
    self.button_B.backgroundColor =nil;
    self.button_C.backgroundColor =nil;
    self.button_D.backgroundColor =nil;
    
 
   [self SetQuestion];
    [self SetAnswers];
    
    // Desabilita e esconde o botão de próximo jogo,
   //  que só deve estar visível e habilitada após a correção da nova pergunta.
    self.NextGame.enabled=NO;
   self.NextGame.hidden=YES;
    

}



- (IBAction)button_A:(id)sender {
    [self givesFeedback:@"A"];
}

- (IBAction)button_B:(id)sender {
    [self givesFeedback:@"B"];
}

- (IBAction)button_C:(id)sender {
    [self givesFeedback:@"C"];
}

- (IBAction)button_D:(id)sender {
    [self givesFeedback:@"D"];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
