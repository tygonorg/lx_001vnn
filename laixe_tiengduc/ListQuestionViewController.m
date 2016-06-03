//
//  ListQuestionViewController.m
//  laixe_tiengduc
//
//  Created by TyGon Co., Ltd. on 6/2/16.
//  Copyright © 2016 TyGon Co., Ltd. All rights reserved.
//

#import "ListQuestionViewController.h"
#import "QuestionCell.h"
@interface ListQuestionViewController ()
{
    DataAccess *dt;
    NSMutableArray *lstQuestion;
}
@end

@implementation ListQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.Title_;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg.png"] forBarMetrics:UIBarMetricsDefault ];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.topItem.title = @"Zurück";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    dt = [[DataAccess alloc] init];
    lstQuestion = [dt GetQuestionByPerfix:self.Perfix];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [lstQuestion count];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CustomCellIdentifier = @"QuestionCell";
    QuestionCell *cell = (QuestionCell *)[self.tbviewContents dequeueReusableCellWithIdentifier: CustomCellIdentifier]; // typecast to customcell
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"QuestionCell" owner:self options:nil];
        
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[QuestionCell class]])
                
                cell = (QuestionCell *)oneObject;
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
        
    }
    
    OQuestion *dic = [lstQuestion objectAtIndex:indexPath.row];
//    NSError *err = nil;
//    cell.lblQuestion.attributedText =
//    [[NSAttributedString alloc]
//     initWithData: [dic.Zquestion dataUsingEncoding:NSUTF8StringEncoding]
//     options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
//     documentAttributes: nil
//     error: &err];
//    if(err)
//        NSLog(@"Unable to parse label text: %@", err);
    
    
    cell.lblQuestion.text = dic.Zquestion;
    cell.lblidquestion.text = dic.ZFreagenKataLog;
    
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Chang");
}



@end
