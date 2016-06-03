//
//  DataAccess.m
//  Luatgiaothong
//
//  Created by Phuoc Hung on 4/20/13.
//  Copyright (c) 2013 Tran Phuoc Hung. All rights reserved.
//

#import "DataAccess.h"

#define kDBFileName @"db"
#define kDBFileExt @"db"
@implementation DataAccess
+ (NSString *)getDBPath
{
    NSString *db_path = [[NSBundle mainBundle] pathForResource:kDBFileName ofType:kDBFileExt];
    return db_path;
}
- (void)createEditableCopyOfDatabaseIfNeeded
{
    // First, test for existence.
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:kDBFileName];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) {
        return;
    }
    // The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:kDBFileName];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
}
- (NSMutableArray*) GetAllQuestionGroup
{
    NSMutableArray *lstdieule=[[NSMutableArray alloc] init];
    NSString* dbpath= [DataAccess getDBPath];
    sqlite3_stmt *stmt;
    const char *path = [dbpath UTF8String];
    if(sqlite3_open(path,&_db)==SQLITE_OK)
    {
        NSString *query = @"select z_pk,zname from zquestionthemegroup order by zorder";
        const char *query_stmt =[query UTF8String];
        if(sqlite3_prepare_v2(_db, query_stmt, -1,&stmt, NULL)==SQLITE_OK)
        {
            int ret;
            while ((ret=sqlite3_step(stmt))==SQLITE_ROW) {
                NSInteger id_c = sqlite3_column_int(stmt,0);
                OQuestionGroup *dl =[[OQuestionGroup alloc] init];
                dl.Id=id_c;
                char *title = (char *)sqlite3_column_text(stmt, 1);
                dl.Name =[NSString stringWithUTF8String:(char *)title];
                // char *contents=(char *)sqlite3_column_text(stmt, 2);
                //dl.Contents =[NSString stringWithUTF8String:(char *)contents];
                [lstdieule addObject:dl];
            }
            sqlite3_finalize(stmt);
        }
        else {
            NSLog(@"err prepare:%s",sqlite3_errmsg(_db));
        }
        //sqlite3_finalize(stmt);
    }
    else {
        NSLog(@"open error:%s",sqlite3_errmsg(_db));
    }
    sqlite3_close(_db);
    return lstdieule;

}
- (NSMutableArray*) GetQuestionThemeByGroupId:(NSInteger) IdGroup{
    NSMutableArray *lstdieule=[[NSMutableArray alloc] init];
    NSString* dbpath= [DataAccess getDBPath];
    sqlite3_stmt *stmt;
    const char *path = [dbpath UTF8String];
    if(sqlite3_open(path,&_db)==SQLITE_OK)
    {
        NSString *query = [NSString stringWithFormat:@"select z_pk,zname,zprefix from zquestiontheme where zgroup =%ld order by zorder",(long)IdGroup];
        const char *query_stmt =[query UTF8String];
        if(sqlite3_prepare_v2(_db, query_stmt, -1,&stmt, NULL)==SQLITE_OK)
        {
            int ret;
            while ((ret=sqlite3_step(stmt))==SQLITE_ROW) {
                NSInteger id_c = sqlite3_column_int(stmt,0);
                OQuestionTheme *dl =[[OQuestionTheme alloc] init];
                dl.Id=id_c;
                char *title = (char *)sqlite3_column_text(stmt, 1);
                dl.Name =[NSString stringWithUTF8String:(char *)title];
                char *contents=(char *)sqlite3_column_text(stmt, 2);
                dl.Prefix =[NSString stringWithUTF8String:(char *)contents];
                [lstdieule addObject:dl];
            }
            sqlite3_finalize(stmt);
        }
        else {
            NSLog(@"err prepare:%s",sqlite3_errmsg(_db));
        }
        //sqlite3_finalize(stmt);
    }
    else {
        NSLog(@"open error:%s",sqlite3_errmsg(_db));
    }
    sqlite3_close(_db);
    return lstdieule;
}
- (NSMutableArray*) GetQuestionByPerfix:(NSString*) perfix{
    NSMutableArray *lstdieule=[[NSMutableArray alloc] init];
    NSString* dbpath= [DataAccess getDBPath];
    sqlite3_stmt *stmt;
    const char *path = [dbpath UTF8String];
    if(sqlite3_open(path,&_db)==SQLITE_OK)
    {
        NSString *query = [NSString stringWithFormat:@"select z_pk,zquestion,zfragenkatalog,zanswer1,zanswer2,zanswer3,zvalid1,zvalid2,zvalid3,zimage from zquestion where zfragenkatalog like '%@%%' and ztype like '%%,3,%%'",perfix];
        NSLog(@"SQL: %@",query);
        const char *query_stmt =[query UTF8String];
        if(sqlite3_prepare_v2(_db, query_stmt, -1,&stmt, NULL)==SQLITE_OK)
        {
            int ret;
            while ((ret=sqlite3_step(stmt))==SQLITE_ROW) {
                NSInteger id_c = sqlite3_column_int(stmt,0);
                OQuestion *dl =[[OQuestion alloc] init];
                dl.Id=id_c;
                char *title = (char *)sqlite3_column_text(stmt, 1);
                
                dl.Zquestion =[NSString stringWithUTF8String:title];
                char *contents=(char *)sqlite3_column_text(stmt, 2);
                dl.ZFreagenKataLog =[NSString stringWithUTF8String:(char *)contents];
                
                char *zanswe1=(char *)sqlite3_column_text(stmt, 3);
                if (zanswe1==NULL) {
                    dl.ZAnswer1=@"";
                } else {
                    dl.ZAnswer1 = [NSString stringWithUTF8String:zanswe1];
                }
                char *zanswe2=(char *)sqlite3_column_text(stmt, 4);
                if (zanswe2==NULL) {
                    dl.ZAnswer2=@"";
                }else{
                    dl.ZAnswer2 = [NSString stringWithUTF8String:zanswe2];
                }
                
                char *zanswe3=(char *)sqlite3_column_text(stmt, 5);
                if (zanswe3==NULL) {
                    dl.ZAnswer3=@"";
                } else {
                    dl.ZAnswer3 = [NSString stringWithUTF8String:zanswe3];
                }
                
                dl.ZValid1 = sqlite3_column_int(stmt,6);
                dl.ZValid2 = sqlite3_column_int(stmt,7);
                dl.ZValid3 = sqlite3_column_int(stmt,8);
                
                
                char *zimage=(char *)sqlite3_column_text(stmt, 9);
                if (zimage==NULL) {
                    dl.Zimage=@"";
                } else {
                    dl.Zimage = [[NSString stringWithUTF8String:zimage] stringByReplacingOccurrencesOfString:@"gfx/small/" withString:@""];
                }

                
                
                [lstdieule addObject:dl];
            }
            sqlite3_finalize(stmt);
        }
        else {
            NSLog(@"err prepare:%s",sqlite3_errmsg(_db));
        }
        //sqlite3_finalize(stmt);
    }
    else {
        NSLog(@"open error:%s",sqlite3_errmsg(_db));
    }
    sqlite3_close(_db);
    return lstdieule;
}

@end
