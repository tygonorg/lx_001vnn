//
//  QuestionTestViewController.m
//  laixe_tiengduc
//
//  Created by TyGon Co., Ltd. on 6/1/16.
//  Copyright © 2016 TyGon Co., Ltd. All rights reserved.
//

#import "QuestionTestViewController.h"
#import "QuestionDetailsType1ViewController.h"
#import "OQuestion.h"
@interface QuestionTestViewController ()
{
    //NSInteger TotalPage;
    NSMutableArray *lstController;
    
}
@end

@implementation QuestionTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.ucControls setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
    // Do any additional setup after loading the view from its nib.
   // TotalPage = self.lstQuestion.count;
    
    if (self.lstQuestion.count==1) {
        self.btnnext.hidden = YES;
        self.btnprev.hidden = YES;
    }
    if (self.CurrentPage==0) {
        self.btnprev.hidden=YES;
    }
    lstController = [[NSMutableArray alloc] init];
    [self InitControllerWData];
    
     self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource = self;
    
    
    QuestionDetailsType1ViewController *startingViewController = [self viewControllerAtIndex:self.CurrentPage];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    

    
    
    self.pageViewController.view.frame = self.uccontent.bounds;
    self.pageViewController.delegate = self;
    [self addChildViewController:self.pageViewController];
    [self.uccontent addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}
- (void) InitControllerWData{
    for (int i=0; i<self.lstQuestion.count; i++) {
        QuestionDetailsType1ViewController *viewcontroller = [[QuestionDetailsType1ViewController alloc] initWithNibName:@"QuestionDetailsType1ViewController" bundle:nil];
        viewcontroller.pageIndex = i;
        viewcontroller.Question = (OQuestion*)[self.lstQuestion objectAtIndex:i];
        [lstController addObject:viewcontroller];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((QuestionDetailsType1ViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((QuestionDetailsType1ViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.lstQuestion count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}
- (QuestionDetailsType1ViewController *)viewControllerAtIndex:(NSUInteger)index
{
    QuestionDetailsType1ViewController *viewcontroller = [lstController objectAtIndex:index];
    self.CurrentPage = index;
    viewcontroller.pageIndex = index;
   // OQuestion *question = [self.lstQuestion objectAtIndex:index];
    //viewcontroller.txtQuestion.text = question.Zquestion;
    if (self.CurrentPage==(self.lstQuestion.count-1)) {
        self.btnnext.hidden = YES;
    } else{
        if (self.lstQuestion.count!=1) {
            self.btnnext.hidden = NO;
        } else {
            self.btnnext.hidden = YES;
        }
        
    }
    if (self.CurrentPage==0) {
        self.btnprev.hidden = YES;
    } else{
        if (self.lstQuestion.count!=1) {
            self.btnprev.hidden = NO;
        } else {
            self.btnprev.hidden = YES;
        }
        
    }
    OQuestion *oquestion = (OQuestion*)[self.lstQuestion objectAtIndex:index];
    self.title = oquestion.ZFreagenKataLog;
    //[viewcontroller.btnAns1 setTitle:[NSString stringWithFormat:@"%ld",index] forState:UIControlStateNormal];
    //viewcontroller.txtQuestion.text = [NSString stringWithFormat:@"%ld",index];
    //NSLog(@"Set text la Index :%ld",index);
    return viewcontroller;
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return lstController.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (IBAction)nextPage:(id)sender {
    NSLog(@"Current page is  :%ld",self.CurrentPage);
    if(self.CurrentPage==(self.lstQuestion.count-1)){
        self.btnnext.hidden=YES;
        return;
    }
    if (self.CurrentPage==0) {
        self.btnprev.hidden=YES;
    }
    //tinh sau
    QuestionDetailsType1ViewController *startingViewController = [self viewControllerAtIndex:self.CurrentPage+1];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (IBAction)prevPage:(id)sender {
    if (self.CurrentPage==0) {
        self.btnprev.hidden=YES;
        return;
    }
    if (self.CurrentPage==(self.lstQuestion.count-1)) {
        self.btnnext.hidden=YES;
    }
    
    QuestionDetailsType1ViewController *startingViewController = [self viewControllerAtIndex:self.CurrentPage-1];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    
}

- (IBAction)testCheck:(id)sender {
    QuestionDetailsType1ViewController *view = [self viewControllerAtIndex:self.CurrentPage];
    
    [view.btnAns1 setImage:[UIImage imageNamed:@"checkbox_off_wrong.png"] forState:UIControlStateNormal];
}
@end
