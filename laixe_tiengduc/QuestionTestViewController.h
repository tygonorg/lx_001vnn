//
//  QuestionTestViewController.h
//  laixe_tiengduc
//
//  Created by TyGon Co., Ltd. on 6/1/16.
//  Copyright © 2016 TyGon Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionTestViewController : UIViewController<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (weak, nonatomic) IBOutlet UIView *ucControls;
@property (weak, nonatomic) IBOutlet UIButton *btnprev;
@property (weak, nonatomic) IBOutlet UIButton *btnnext;
@property (weak, nonatomic) IBOutlet UIButton *btnOK;
- (IBAction)nextPage:(id)sender;
- (IBAction)prevPage:(id)sender;

- (IBAction)testCheck:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *uccontent;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property NSMutableArray* lstQuestion;
@property NSInteger CurrentPage;
@end
