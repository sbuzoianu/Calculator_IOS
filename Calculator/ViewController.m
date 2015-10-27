//
//  ViewController.m
//  Calculator
//
//  Created by Stefan on 12/10/15.
//  Copyright © 2015 Stefan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString *stack; //retine numarul apasat
    double result;
    int optype;
    NSMutableArray *buttonArray;

}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    buttonArray = [[NSMutableArray alloc] init];
    [self addLabel];
    [self addMyButton]; // adaug toate butoanele
    stack=@""; //initializare pe string gol
}

- (void) addLabel{
    _consoleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 28, 320, 56)];
    [_consoleLabel setText:@"Introduceți numărul"];
    [_consoleLabel setTextAlignment:NSTextAlignmentCenter];
    [_consoleLabel.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [_consoleLabel.layer setBorderColor:[UIColor greenColor].CGColor];
    [_consoleLabel.layer setBorderWidth:1];
    [_consoleLabel setTextColor:[UIColor colorWithRed:0.871 green:0.871 blue:0.871 alpha:1]];
    [self.view addSubview:_consoleLabel];
}
- (void) addMyButton{
    int t=-1;
    int k=0;
    for (int i = 0; i <= 9; i = i + 1) {
        if(i%3==0)
        {
            k=0;
            t++;
        }
        // However you wish to get your button
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(k*80-1, 84+t*80, 80, 80);
        [button setTitle:({NSString *string= [NSString stringWithFormat: @"%d", i]; string;}) forState:UIControlStateNormal];
        [button.layer setBorderWidth:1];
        [button.layer setBorderColor:[UIColor greenColor].CGColor];
        [button.layer setBackgroundColor:[UIColor grayColor].CGColor];
        [buttonArray addObject:button];
        [self.view addSubview:button];
        [button addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    //    NSLog(@"%@", buttonArray);
        k++;

    }
    // butonul de sterge
    UIButton *sterge = [UIButton buttonWithType:UIButtonTypeCustom];
    sterge.frame=CGRectMake(79, 323, 160, 80);
    [sterge setTitle:@"Sterge" forState:UIControlStateNormal];
    [sterge.layer setBorderWidth:1];
    [sterge.layer setBorderColor:[UIColor greenColor].CGColor];
    [sterge.layer setBackgroundColor:[UIColor grayColor].CGColor];
    [self.view addSubview:sterge];
    [sterge addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:sterge];
    
    //butonul de plus
    UIButton *plus = [UIButton buttonWithType:UIButtonTypeCustom];
    plus.frame=CGRectMake(239, 84, 80, 80);
    [plus setTitle:@"+" forState:UIControlStateNormal];
    [plus.layer setBorderWidth:1];
    [plus.layer setBorderColor:[UIColor greenColor].CGColor];
    [plus.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:plus];
    [plus addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:plus]; // a intrat pe index 11
    
    //butonul de minus
    UIButton *minus = [UIButton buttonWithType:UIButtonTypeCustom];
    minus.frame=CGRectMake(239, 163, 80, 80);
    [minus setTitle:@"-" forState:UIControlStateNormal];
    [minus.layer setBorderWidth:1];
    [minus.layer setBorderColor:[UIColor greenColor].CGColor];
    [minus.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:minus];
    [minus addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:minus]; // a intrat pe index 12


    //butonul de produs
    UIButton *produs = [UIButton buttonWithType:UIButtonTypeCustom];
    produs.frame=CGRectMake(239, 243, 80, 80);
    [produs setTitle:@"*" forState:UIControlStateNormal];
    [produs.layer setBorderWidth:1];
    [produs.layer setBorderColor:[UIColor greenColor].CGColor];
    [produs.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:produs];
    [produs addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:produs]; // a intrat pe index 13
    
    //butonul de div
    UIButton *div = [UIButton buttonWithType:UIButtonTypeCustom];
    div.frame=CGRectMake(239, 323, 80, 80);
    [div setTitle:@":" forState:UIControlStateNormal];
    [div.layer setBorderWidth:1];
    [div.layer setBorderColor:[UIColor greenColor].CGColor];
    [div.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:div];
    [div addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:div]; // a intrat pe index 14

    // butonul de clear
    UIButton *clear = [UIButton buttonWithType:UIButtonTypeCustom];
    clear.frame=CGRectMake(0, 403, 80, 80);
    [clear setTitle:@"Clear" forState:UIControlStateNormal];
    [clear.layer setBorderWidth:1];
    [clear.layer setBorderColor:[UIColor greenColor].CGColor];
    [clear.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:clear];
    [clear addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:clear]; // a intrat pe index 15
    
    // butonul de egal
    UIButton *egal = [UIButton buttonWithType:UIButtonTypeCustom];
    egal.frame=CGRectMake(79, 403, 160, 80);
    [egal setTitle:@"=" forState:UIControlStateNormal];
    [egal.layer setBorderWidth:1];
    [egal.layer setBorderColor:[UIColor greenColor].CGColor];
    [egal.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:egal];
    [egal addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:egal]; // a intrat pe index 16
  
    // butonul de zecimal
    UIButton *zecimal = [UIButton buttonWithType:UIButtonTypeCustom];
    zecimal.frame=CGRectMake(239, 403, 80, 80);
    [zecimal setTitle:@"." forState:UIControlStateNormal];
    [zecimal.layer setBorderWidth:1];
    [zecimal.layer setBorderColor:[UIColor greenColor].CGColor];
    [zecimal.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:zecimal];
    [zecimal addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:zecimal]; // a intrat pe index 17
    
}

- (void) bPressed:(UIButton*) button
{
    int index = (int)[buttonArray indexOfObject:button];
    
    switch (index) {
        case 10: {
            [self addnumber:-1]; // delete
            break;

        }
        
        case 11: {
            [self logic:1]; //plus
            break;

        }
        
        case 12: {
            [self logic:2]; //minus
            break;
            
        }
        case 13: {
            [self logic:3]; //produs
            break;
            
        }
        case 14: {
            [self logic:4]; //div
            break;
            
        }
            
        case 15: {
            stack=@"";
            result=0.0;
            optype = -1;
            [_consoleLabel setText:stack]; //clear
            break;
        }

        case 16: {
            [self logic:0]; //egal
            break;
            
        }
            
        case 17: {
            stack = [NSString stringWithFormat:@"%1$@.", stack];
            [_consoleLabel setText:stack];  //zecimal
            break;
            
        }

            
        default:
        {
            [self addnumber:index];
            break;


        }
    }

        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)logic:(int)type{
    if(type == 0){ // Equals
        if(optype == 1){
            stack = [NSString stringWithFormat:@"%.2f", [stack doubleValue]+result];
        }else if(optype == 2){
            stack = [NSString stringWithFormat:@"%.2f", -[stack doubleValue]+result];
            
        }else if(optype == 3){
            stack = [NSString stringWithFormat:@"%.2f", [stack doubleValue]*result];
            
        }else if(optype == 4){
            stack = [NSString stringWithFormat:@"%.2f", result/[stack doubleValue]];
            
        }
        [_consoleLabel setText:stack];
        [_opperator setText:@"="];
    }else{
        if(type == 1){ // addition
            [_opperator setText:@" "];
            
        }else if(type == 2){ // subtraction
            [_opperator setText:@"-"];
        }else if(type == 3){ // multiply
            [_opperator setText:@"*"];
        }else if(type == 4){ // division
            [_opperator setText:@"/"];
        }
        optype = type;
        result = [stack doubleValue];
        stack = @"0";
        [_consoleLabel setText:stack];
        
    }
}
-(void)addnumber:(int)number{
    if (stack==NULL)
    {
    //    stack=@"0";
    }
    
    if(number > -1){
        stack = [NSString stringWithFormat:@"%1$@%2$d", stack, number];
    }else if(stack.length > 0){
        stack = [stack substringToIndex:stack.length-1];
    }
    if(stack.length <= 0){
        stack = @"";
    }
    [_consoleLabel setText:stack];
    NSLog(@"Stiva este: %@", stack);
    NSLog(@"Rez. este: %.02f", result);


}

@end
