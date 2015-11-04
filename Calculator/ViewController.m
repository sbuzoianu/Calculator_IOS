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
    UIView *newView;
}
@property (nonatomic) BOOL userIsOnTheMiddleOfText;

@end

@implementation ViewController

@synthesize userIsOnTheMiddleOfText=_userIsOnTheMiddleOfText;

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

// genereaza un UIImage care va fi folosit ca si fundal de buton SELECTED!
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
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
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(k*80, 84+t*80, 80, 80);
        [button setTitle:({NSString *string= [NSString stringWithFormat: @"%d", i]; string;}) forState:UIControlStateNormal];
        [button.layer setBorderWidth:1];
        [button.layer setBorderColor:[UIColor greenColor].CGColor];
        [button.layer setBackgroundColor:[UIColor grayColor].CGColor];
        [buttonArray addObject:button];
        [self.view addSubview:button];
        [button addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
       // NSLog(@"%@", buttonArray);
        k++;

    }
    // butonul de sterge
    UIButton *sterge = [UIButton buttonWithType:UIButtonTypeCustom];
    sterge.frame=CGRectMake(80, 324, 160, 80);
    [sterge setTitle:@"Sterge" forState:UIControlStateNormal];
    [sterge.layer setBorderWidth:1];
    [sterge.layer setBorderColor:[UIColor greenColor].CGColor];
    [sterge.layer setBackgroundColor:[UIColor grayColor].CGColor];
    [self.view addSubview:sterge];
    [sterge addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:sterge];
    
    //butonul de plus
    UIButton *plus = [UIButton buttonWithType:UIButtonTypeCustom];
    plus.frame=CGRectMake(240, 84, 80, 80);
    [plus setTitle:@"+" forState:UIControlStateNormal];
    [plus setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [plus setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:109.0f/255.0f green:82.0f/255.0f blue:0.0f/255.0f alpha:1.0]] forState:UIControlStateSelected];

    [plus.layer setBorderWidth:1];
    [plus.layer setBorderColor:[UIColor greenColor].CGColor];
    [plus.layer setBackgroundColor:[UIColor brownColor].CGColor];

    [self.view addSubview:plus];
    [plus addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:plus]; // a intrat pe index 11
    
    //butonul de minus
    UIButton *minus = [UIButton buttonWithType:UIButtonTypeCustom];
    minus.frame=CGRectMake(240, 164, 80, 80);
    [minus setTitle:@"-" forState:UIControlStateNormal];
    [minus setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:109.0f/255.0f green:82.0f/255.0f blue:0.0f/255.0f alpha:1.0]] forState:UIControlStateSelected];

    [minus.layer setBorderWidth:1];
    [minus.layer setBorderColor:[UIColor greenColor].CGColor];
    [minus.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:minus];
    [minus addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:minus]; // a intrat pe index 12


    //butonul de produs
    UIButton *produs = [UIButton buttonWithType:UIButtonTypeCustom];
    produs.frame=CGRectMake(240, 244, 80, 80);
    [produs setTitle:@"*" forState:UIControlStateNormal];
    [produs setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:109.0f/255.0f green:82.0f/255.0f blue:0.0f/255.0f alpha:1.0]] forState:UIControlStateSelected];

    [produs.layer setBorderWidth:1];
    [produs.layer setBorderColor:[UIColor greenColor].CGColor];
    [produs.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:produs];
    [produs addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:produs]; // a intrat pe index 13
    
    //butonul de div
    UIButton *div = [UIButton buttonWithType:UIButtonTypeCustom];
    div.frame=CGRectMake(240, 324, 80, 80);
    [div setTitle:@":" forState:UIControlStateNormal];
    [div setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:109.0f/255.0f green:82.0f/255.0f blue:0.0f/255.0f alpha:1.0]] forState:UIControlStateSelected];

    [div.layer setBorderWidth:1];
    [div.layer setBorderColor:[UIColor greenColor].CGColor];
    [div.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:div];
    [div addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:div]; // a intrat pe index 14

    // butonul de clear
    UIButton *clear = [UIButton buttonWithType:UIButtonTypeCustom];
    clear.frame=CGRectMake(0, 404, 80, 80);
    [clear setTitle:@"Clear" forState:UIControlStateNormal];
    [clear.layer setBorderWidth:1];
    [clear.layer setBorderColor:[UIColor greenColor].CGColor];
    [clear.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:clear];
    [clear addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:clear]; // a intrat pe index 15
    
    // butonul de egal
    UIButton *egal = [UIButton buttonWithType:UIButtonTypeCustom];
    egal.frame=CGRectMake(80, 404, 160, 80);
    [egal setTitle:@"=" forState:UIControlStateNormal];
    [egal.layer setBorderWidth:1];
    [egal.layer setBorderColor:[UIColor greenColor].CGColor];
    [egal.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:egal];
    [egal addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:egal]; // a intrat pe index 16
  
    // butonul de zecimal
    UIButton *zecimal = [UIButton buttonWithType:UIButtonTypeCustom];
    zecimal.frame=CGRectMake(240, 404, 80, 80);
    [zecimal setTitle:@"." forState:UIControlStateNormal];
    [zecimal.layer setBorderWidth:1];
    [zecimal.layer setBorderColor:[UIColor greenColor].CGColor];
    [zecimal.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:zecimal];
    [zecimal addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:zecimal]; // a intrat pe index 17
    
    // butonul de SQRT
    UIButton *radacina = [UIButton buttonWithType:UIButtonTypeCustom];
    radacina.frame=CGRectMake(0, 484, 80, 80);
    [radacina setTitle:@"√" forState:UIControlStateNormal];
    [radacina.layer setBorderWidth:1];
    [radacina.layer setBorderColor:[UIColor greenColor].CGColor];
    [radacina.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:radacina];
    [radacina addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:radacina]; // a intrat pe index 18

    // butonul de +/-
    UIButton *semn = [UIButton buttonWithType:UIButtonTypeCustom];
    semn.frame=CGRectMake(80, 484, 80, 80);
    [semn setTitle:@"∓" forState:UIControlStateNormal];
    [semn.layer setBorderWidth:1];
    [semn.layer setBorderColor:[UIColor greenColor].CGColor];
    [semn.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:semn];
    [semn addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:semn]; // a intrat pe index 19
    
    // butonul de pi
    UIButton *pi = [UIButton buttonWithType:UIButtonTypeCustom];
    pi.frame=CGRectMake(160, 484, 80, 80);
    [pi setTitle:@"π" forState:UIControlStateNormal];
    [pi.layer setBorderWidth:1];
    [pi.layer setBorderColor:[UIColor greenColor].CGColor];
    [pi.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:pi];
    [pi addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:pi]; // a intrat pe index 20
    
    // butonul de logaritm zecimal
    UIButton *log = [UIButton buttonWithType:UIButtonTypeCustom];
    log.frame=CGRectMake(240, 484, 80, 80);
    [log setTitle:@"log" forState:UIControlStateNormal];
    [log.layer setBorderWidth:1];
    [log.layer setBorderColor:[UIColor greenColor].CGColor];
    [log.layer setBackgroundColor:[UIColor brownColor].CGColor];
    [self.view addSubview:log];
    [log addTarget:self action:@selector(bPressed:) forControlEvents:UIControlEventTouchUpInside];
    [buttonArray addObject:log]; // a intrat pe index 21

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
            [self logic:1 :button]; //plus
            [button setSelected:!button.selected];
            break;

        }
        
        case 12: {
            [self logic:2 :button]; //minus
            [button setSelected:!button.selected];

            break;
            
        }
        case 13: {
            [self logic:3 :button]; //produs
            [button setSelected:!button.selected];

            break;
            
        }
        case 14: {
            [self logic:4 :button]; //div
            [button setSelected:!button.selected];

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
            [self logic:0 :button]; //egal
            break;
            
        }
            
        case 17: {
            stack = [NSString stringWithFormat:@"%1$@.", stack];
            [_consoleLabel setText:stack];  //zecimal
            break;
            
        }

            
        case 18: {
            stack=[NSString stringWithFormat:@"%.2f", sqrt([stack doubleValue])];
            [_consoleLabel setText:stack];  //radacina patrata
            break;
            
        }
        
        case 19: {
            NSString *originalstack=[stack copy];
            if ([stack hasPrefix:@"-"])
            {
                stack=[originalstack substringFromIndex:1];
            }
            else
            {
                NSMutableString *final =[NSMutableString stringWithString:stack];
                [final insertString:@"-" atIndex:0];
                stack=[final copy];
            }
                
            [_consoleLabel setText:stack];  //se schimba semnul
            break;
            
        }

        case 20: {
            stack=[NSString stringWithFormat:@"%.2f", 3.14*[stack doubleValue]];
            [_consoleLabel setText:stack];  // calcul pi
            break;
            
        }
    
            
        case 21: {
            if ([stack doubleValue]>0)
            {
            stack=[NSString stringWithFormat:@"%.2f", log([stack doubleValue])];
            }
            [_consoleLabel setText:stack];  // calcul logaritm zecimal
            break;
            
        }
         
        default:
        {
            [self addnumber:index];
            break;


        }
    }

        
}


-(void)logic:(int)type :(UIButton*) button{
    if(type == 0){ // s-a apasat =
        if(optype == 1){
            stack = [NSString stringWithFormat:@"%.2f", [stack doubleValue]+result];
            UIButton *button = [buttonArray objectAtIndex:11];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
            [button setSelected:!button.selected];

        }else if(optype == 2){
            stack = [NSString stringWithFormat:@"%.2f", -[stack doubleValue]+result];
            UIButton *button = [buttonArray objectAtIndex:12];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
            [button setSelected:!button.selected];
 
            
        }else if(optype == 3){
            stack = [NSString stringWithFormat:@"%.2f", [stack doubleValue]*result];
            UIButton *button = [buttonArray objectAtIndex:13];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
            [button setSelected:!button.selected];

        }else if(optype == 4){
            stack = [NSString stringWithFormat:@"%.2f", result/[stack doubleValue]];
            UIButton *button = [buttonArray objectAtIndex:14];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];

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
        stack = @"";
        [_consoleLabel setText:stack];
        
    }
}
-(void)addnumber:(int)number{
    
    if(number > -1) // daca s-a apasat o cifra
        {
            if(self.userIsOnTheMiddleOfText) // avem deja cifre in Label
            {
                stack = [NSString stringWithFormat:@"%1$@%2$d", stack, number];
            }
            else // nu avem cifre in Label
                {
                    stack = [NSString stringWithFormat:@"%d", number];
                    self.userIsOnTheMiddleOfText=TRUE;
                }
        }
    else if (stack.length>0) // s-a apasat Sterge
    {
        stack = [stack substringToIndex:stack.length-1];
    }
    
    [_consoleLabel setText:stack];
//   NSLog(@"Stiva este: %@", stack);
//   NSLog(@"Rez. este: %.02f", result);


}

@end
