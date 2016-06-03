//
//  QuestionDetailsType1ViewController.m
//  laixe_tiengduc
//
//  Created by TyGon Co., Ltd. on 6/3/16.
//  Copyright © 2016 TyGon Co., Ltd. All rights reserved.
//

#import "QuestionDetailsType1ViewController.h"

@interface QuestionDetailsType1ViewController ()

@end

@implementation QuestionDetailsType1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
//    self.navigationController.navigationBar.hidden = YES;
    self.txtQuestion.text = self.Question.Zquestion;
    [self.txtQuestion setFont: [UIFont fontWithName:@"HelveticaNeue" size:17.0]];
    self.title = self.Question.ZFreagenKataLog;
    //NSLog(@"Tao page :%ld",self.pageIndex);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)touch_2:(id)sender {
    if(self.btnAns2.tag==0){
        self.btnAns2.tag=1;
        [self.btnAns2 setImage:[UIImage imageNamed:@"checkbox_on_mini.png"] forState:UIControlStateNormal];
        return;
    }
    if(self.btnAns2.tag==1){
        self.btnAns2.tag=0;
        [self.btnAns2 setImage:[UIImage imageNamed:@"checkbox_off_mini.png"] forState:UIControlStateNormal];
        return;
    }
    
}

- (IBAction)touch_1:(id)sender {
    if(self.btnAns1.tag==0){
        self.btnAns1.tag=1;
        [self.btnAns1 setImage:[UIImage imageNamed:@"checkbox_on_mini.png"] forState:UIControlStateNormal];
        return;
    }
    if(self.btnAns1.tag==1){
        self.btnAns1.tag=0;
        [self.btnAns1 setImage:[UIImage imageNamed:@"checkbox_off_mini.png"] forState:UIControlStateNormal];
        return;
    }
}

- (IBAction)touch_3:(id)sender {
    if(self.btnAbs3.tag==0){
        self.btnAbs3.tag=1;
        [self.btnAbs3 setImage:[UIImage imageNamed:@"checkbox_on_mini.png"] forState:UIControlStateNormal];
        return;
    }
    if(self.btnAbs3.tag==1){
        self.btnAbs3.tag=0;
        [self.btnAbs3 setImage:[UIImage imageNamed:@"checkbox_off_mini.png"] forState:UIControlStateNormal];
        return;
    }
}
@end
