//
//  DataAccess.h
//  Luatgiaothong
//
//  Created by Phuoc Hung on 4/20/13.
//  Copyright (c) 2013 Tran Phuoc Hung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "OQuestionGroup.h"
#import "OQuestionTheme.h"
#import "OQuestion.h"
@interface DataAccess : NSObject
{
    sqlite3 *_db;
    NSString *databasePath;
}


- (void)createEditableCopyOfDatabaseIfNeeded;
- (NSMutableArray*) GetAllQuestionGroup;
- (NSMutableArray*) GetQuestionThemeByGroupId:(NSInteger) IdGroup;
- (NSMutableArray*) GetQuestionByPerfix:(NSString*) perfix;
@end
