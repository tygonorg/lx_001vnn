//
//  QuestionGroupViewController.m
//  laixe_tiengduc
//
//  Created by TyGon Co., Ltd. on 5/30/16.
//  Copyright © 2016 TyGon Co., Ltd. All rights reserved.
//

#import "QuestionGroupViewController.h"
#import "DataAccess.h"
#import "QuestionThemeCell.h"
@interface QuestionGroupViewController ()
{
    NSMutableArray *lstGroup;
    DataAccess *dt;
}
@end

@implementation QuestionGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    dt = [[DataAccess alloc] init];
    lstGroup = [dt GetAllQuestionGroup];
    self.title =@"TEST";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return lstGroup.count;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    OQuestionGroup *gr =(OQuestionGroup*) [lstGroup objectAtIndex:section];
    return gr.Name;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    OQuestionGroup *oqg = [lstGroup objectAtIndex:section];
    NSMutableArray *lstOQT = [dt GetQuestionThemeByGroupId:oqg.Id];
    
    return lstOQT.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OQuestionGroup *oqg = [lstGroup objectAtIndex:indexPath.section];
    NSMutableArray *lstOQT = [dt GetQuestionThemeByGroupId:oqg.Id];
    
    
    static NSString *CustomCellIdentifier = @"LessonTableCell";
    QuestionThemeCell *cell = (QuestionThemeCell *)[self.tbviewQuestionGroup dequeueReusableCellWithIdentifier: CustomCellIdentifier]; // typecast to customcell
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"QuestionThemeCell" owner:self options:nil];
        
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[QuestionThemeCell class]])
                
                cell = (QuestionThemeCell *)oneObject;
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
        
    }
    
    //NSLog(@"%d",indexPath.row);
    //return cell;
    if(indexPath==nil){
        return nil;
    }
    OQuestionTheme *questiontheme = (OQuestionTheme*) [lstOQT objectAtIndex:indexPath.row];
    cell.lblPrefix.text = questiontheme.Prefix;
    cell.lblTitles.text = questiontheme.Name;
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:    (NSInteger)section {
    
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.textLabel.textColor = [UIColor redColor];
    header.textLabel.font = [UIFont boldSystemFontOfSize:10];
    CGRect headerFrame = header.frame;
    header.textLabel.frame = headerFrame;
    //header.textLabel.text= @"Table Title aaaaa aaaaaa aaaa aaa aaa aaa aaa";
    header.textLabel.textAlignment = NSTextAlignmentLeft;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 73;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

@end
