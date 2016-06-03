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
    self.txtQuestion.text = [NSString stringWithFormat:@"%ld",self.pageIndex];
    NSLog(@"Tao page :%ld",self.pageIndex);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
