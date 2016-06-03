//
//  QuestionTestViewController.m
//  laixe_tiengduc
//
//  Created by TyGon Co., Ltd. on 6/1/16.
//  Copyright © 2016 TyGon Co., Ltd. All rights reserved.
//

#import "QuestionTestViewController.h"
#import "QuestionDetailsType1ViewController.h"

@interface QuestionTestViewController ()
{
    NSInteger TotalPage;
    NSInteger CurrentPage;
}
@end

@implementation QuestionTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.ucControls setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
    // Do any additional setup after loading the view from its nib.
    TotalPage = 15;
    CurrentPage =1;
     self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource = self;
    
    
    QuestionDetailsType1ViewController *startingViewController = [self viewControllerAtIndex:CurrentPage];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    

    
    
    self.pageViewController.view.frame = self.uccontent.bounds;
    self.pageViewController.delegate = self;
    [self addChildViewController:self.pageViewController];
    [self.uccontent addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index = ((QuestionDetailsType1ViewController*) viewController).pageIndex;
    //NSLog(@"Index :%ld",index);
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController;{
    NSUInteger index = ((QuestionDetailsType1ViewController*) viewController).pageIndex;
    //NSLog(@"Index :%ld",index);
    
    
    if (index == NSNotFound) {
        return nil;
    }
    
   
    CurrentPage = index;
    if (index == TotalPage) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}
- (QuestionDetailsType1ViewController *)viewControllerAtIndex:(NSUInteger)index
{
    QuestionDetailsType1ViewController *viewcontroller = [[QuestionDetailsType1ViewController alloc] initWithNibName:@"QuestionDetailsType1ViewController" bundle:nil];
    CurrentPage = index;
    viewcontroller.pageIndex = index;
    [viewcontroller.btnAns1 setTitle:[NSString stringWithFormat:@"%ld",index] forState:UIControlStateNormal];
    viewcontroller.txtQuestion.text = [NSString stringWithFormat:@"%ld",index];
    NSLog(@"Set text la Index :%ld",index);
    return viewcontroller;
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return TotalPage;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (IBAction)nextPage:(id)sender {
    QuestionDetailsType1ViewController *startingViewController = [self viewControllerAtIndex:CurrentPage+1];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}
@end
