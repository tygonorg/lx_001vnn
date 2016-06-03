//
//  QuestionDetailsType1ViewController.h
//  laixe_tiengduc
//
//  Created by TyGon Co., Ltd. on 6/3/16.
//  Copyright © 2016 TyGon Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OQuestion.h"
@interface QuestionDetailsType1ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnAns1;
@property (weak, nonatomic) IBOutlet UIButton *btnAns2;
@property (weak, nonatomic) IBOutlet UITextView *txtQuestion;
@property (weak, nonatomic) IBOutlet UIButton *btnAbs3;
- (IBAction)touch_2:(id)sender;
- (IBAction)touch_1:(id)sender;
- (IBAction)touch_3:(id)sender;
@property NSInteger pageIndex;
@property OQuestion *Question;
@end
