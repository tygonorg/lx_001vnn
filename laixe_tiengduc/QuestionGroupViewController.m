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
#import "KlasseBCell.h"
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
    self.title =@"Fragenkatalog";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg.png"] forBarMetrics:UIBarMetricsDefault ];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.topItem.title = @"Zurück";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:self action:@selector(ChangeLange:)];
    [anotherButton setBackgroundImage:[UIImage imageNamed:@"vi.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault ];
    self.navigationItem.rightBarButtonItem = anotherButton;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ChangeLange:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Bạn có muốn Chon ngon ngu?" delegate:self cancelButtonTitle:@"Không" otherButtonTitles:@"Có", nil];
    [alert show];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return lstGroup.count+1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return @"KLASSE B";
    }
    OQuestionGroup *gr =(OQuestionGroup*) [lstGroup objectAtIndex:section -1];
    return [[gr.Name stringByReplacingOccurrencesOfString:@"Amtlicher Fragenkatalog nach Themen sortiert: " withString:@""] uppercaseString];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 5;
    }
    OQuestionGroup *oqg = [lstGroup objectAtIndex:section-1];
    NSMutableArray *lstOQT = [dt GetQuestionThemeByGroupId:oqg.Id];
    
    return lstOQT.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
        //KlasseBCell
        
        KlasseBCell *cell1 = (KlasseBCell *)[self.tbviewQuestionGroup dequeueReusableCellWithIdentifier: @"KlasseBCell"]; // typecast to customcell
        
        [cell1 setSelectionStyle:UITableViewCellSelectionStyleBlue];
        
        if (cell1 == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"KlasseBCell" owner:self options:nil];
            
            for (id oneObject in nib)
                if ([oneObject isKindOfClass:[KlasseBCell class]])
                    
                    cell1 = (KlasseBCell *)oneObject;
            
            [cell1 setSelectionStyle:UITableViewCellSelectionStyleBlue];
            
        }
        if (indexPath.row==0) {
            cell1.lbl_Klass.text = @"Schwerig markierte Fragen";
            cell1.uc_Klass.hidden = YES;
        }
        if (indexPath.row==1) {
            cell1.lbl_Klass.text = @"Falsch beanwortete Fragen";
            [cell1.img_klass setImage:[UIImage imageNamed:@"icon2.png"]];
            cell1.uc_Klass.hidden = YES;
        }
        if (indexPath.row==2) {
            cell1.lbl_Klass.text = @"Zahlenfragen";
            [cell1.img_klass setImage:[UIImage imageNamed:@"icon3.png"]];
            cell1.uc_Klass.hidden = YES;
        }
        if (indexPath.row==3) {
            cell1.lbl_Klass.text = @"Filmfragen";
            [cell1.img_klass setImage:[UIImage imageNamed:@"icon4.png"]];
            cell1.uc_Klass.hidden = YES;
        }
        if (indexPath.row==4) {
            cell1.lbl_Klass.text = @"Lösung anzeigen";
            [cell1.img_klass setImage:[UIImage imageNamed:@"icon5.png"]];
        }
        
        return cell1;
    }
    OQuestionGroup *oqg = [lstGroup objectAtIndex:indexPath.section -1];
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
    header.backgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    //[header setBackgroundColor:[UIColor redColor]];
    header.textLabel.textColor = [UIColor whiteColor];
    header.textLabel.font = [UIFont boldSystemFontOfSize:12];
    CGRect headerFrame = header.frame;
    header.textLabel.frame = headerFrame;
    header.textLabel.textAlignment = NSTextAlignmentLeft;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 73;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 40;
//}

@end
