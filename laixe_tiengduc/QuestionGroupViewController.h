//
//  QuestionGroupViewController.h
//  laixe_tiengduc
//
//  Created by TyGon Co., Ltd. on 5/30/16.
//  Copyright © 2016 TyGon Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionGroupViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tbviewQuestionGroup;

@end
