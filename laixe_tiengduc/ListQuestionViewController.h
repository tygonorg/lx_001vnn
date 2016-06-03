//
//  ListQuestionViewController.h
//  laixe_tiengduc
//
//  Created by TyGon Co., Ltd. on 6/2/16.
//  Copyright © 2016 TyGon Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataAccess.h"
@interface ListQuestionViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tbviewContents;
@property NSString *Title_;
@property NSString *Perfix;
@end
