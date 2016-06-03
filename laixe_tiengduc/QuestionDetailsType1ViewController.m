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
    
    if ([self.Question.ZAnswer1 isEqualToString:@""]) {
        self.lblAns1.hidden=YES;
        self.btnAns1.hidden=YES;
    } else{
        self.lblAns1.text = self.Question.ZAnswer1;
    }
    
    if ([self.Question.ZAnswer2 isEqualToString:@""]) {
        self.lblAns2.hidden=YES;
        self.btnAns2.hidden=YES;
    } else{
        self.lblAns2.text = self.Question.ZAnswer3;
    }
    
    if ([self.Question.ZAnswer3 isEqualToString:@""]) {
        self.lblAns3.hidden=YES;
        self.btnAbs3.hidden=YES;
    } else{
        self.lblAns3.text = self.Question.ZAnswer3;
    }
    if (![self.Question.Zimage isEqualToString:@""]) {
        [self.img_Test setImage:[UIImage imageNamed:self.Question.Zimage]];
    }
    
}
- (BOOL) checkISUserCheck{
    if (self.btnAns1.tag==1||self.btnAns2.tag==1||self.btnAbs3.tag==1) {
        return YES;
    }
    return NO;
}
- (void) CheckAndShowAns{
    //nguoi dung co tra loi
    if (self.btnAns1.tag==2||self.btnAns2.tag==2||self.btnAbs3.tag==2) {
        return;
    }
    
    if ([self checkISUserCheck]) {
        
    } else {
        // nguoi dung ko tra loi gi ca
        if (![self.Question.ZAnswer1 isEqualToString:@""]) {
            if (self.Question.ZValid1==1) {
                [self.btnAns1 setImage:[UIImage imageNamed:@"checkbox_off_right.png"] forState:UIControlStateNormal];
            } else {
                 [self.btnAns1 setImage:[UIImage imageNamed:@"checkbox_off_wrong.png"] forState:UIControlStateNormal];
            }
        }
        if (![self.Question.ZAnswer2 isEqualToString:@""]) {
            if (self.Question.ZValid2==1) {
                [self.btnAns2 setImage:[UIImage imageNamed:@"checkbox_off_right.png"] forState:UIControlStateNormal];
            } else {
                [self.btnAns2 setImage:[UIImage imageNamed:@"checkbox_off_wrong.png"] forState:UIControlStateNormal];
            }
        }
        if (![self.Question.ZAnswer3 isEqualToString:@""]) {
            if (self.Question.ZValid3==1) {
                [self.btnAbs3 setImage:[UIImage imageNamed:@"checkbox_off_right.png"] forState:UIControlStateNormal];
            } else {
                [self.btnAbs3 setImage:[UIImage imageNamed:@"checkbox_off_wrong.png"] forState:UIControlStateNormal];
            }
        }
        
        
        
        
        
    }
    self.btnAns1.tag=2;
    self.btnAns2.tag=2;
    self.btnAbs3.tag=2;

}

- (IBAction)touch_2:(id)sender {
    if(self.btnAns2.tag==2){
        return;
    }
    
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
    if(self.btnAns1.tag==2){
        return;
    }
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
    if(self.btnAbs3.tag==2){
        return;
    }
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
