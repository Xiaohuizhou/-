//
//  ZGHDataBase.m
//  雨露健康助手
//
//  Created by 周凯辉 on 15/10/6.
//  Copyright (c) 2015年 周光辉. All rights reserved.
//

#import "ZGHDataBase.h"
#import "FMDatabase.h"

@implementation ZGHDataBase
{
    FMDatabase *_fmdb;
}

static ZGHDataBase *g_database = nil;

+(ZGHDataBase *)defaultDataBase{
    if (!g_database) {
        g_database = [[ZGHDataBase alloc]init];
    }
    
    return g_database;
}
-(id)init{
    if (self = [super init]) {
        NSString *dbPath =[NSHomeDirectory() stringByAppendingString:@"/Documents/user.db"];
        _fmdb = [[FMDatabase alloc]initWithPath:dbPath];
        NSLog(@"%@",dbPath);
        [_fmdb open];
        NSString *sql = @"create table if not exists userInfo(id integer primary key autoincrement not null, title varchar(128),briefinfo varchar(1024),imgurl varchar(1024),url varchar(2048))";
        if (![_fmdb executeUpdate:sql]) {
            NSLog(@"建表失败%@",_fmdb.lastErrorMessage);
        }
    }
    return self;
}

//1.增加数据
-(BOOL)addDataWithModel:(ZGHConsModel *)model{
 NSString *sql = @"insert into userinfo(id,title,briefinfo,imgurl,url) values(?,?,?,?,?)";
    BOOL b = [_fmdb executeUpdate:sql,model.id,model.title,model.briefinfo,model.imgurl,model.url];
    return b;

}
//2.删除数据
-(BOOL)deleteDataWithModel:(ZGHConsModel *)model{

    NSString *sql = @"delete from userInfo where id=?";
    
    BOOL b = [_fmdb executeUpdate:sql,model.id];

    return b;
}

//3.查找数据
-(BOOL)findDataWithModel:(ZGHConsModel *)model{
    NSString *sql = @"select count(*) from userinfo where id=?";
    FMResultSet *set =[_fmdb executeQuery:sql,model.id];
    int count = 0;
    if ([set next]) {
        count = [set intForColumnIndex:0];
    }
    return count;
    
}


//4.取数据
-(NSArray *)getData{
//    NSString *sql = @"select count(*) from userinfo where id=?";
//    FMResultSet *set =[_fmdb executeQuery:sql,model.id];

    NSString *sql = @"select * from userinfo";
    FMResultSet *set = [_fmdb executeQuery:sql];
    //遍历结果集
    NSMutableArray *array = [NSMutableArray array];
    
    //遍历结果集，将数据库里面的相关数据取出放在数组中
    while ([set next]) {
        ZGHConsModel *model = [[ZGHConsModel alloc]init];
        model.url = [set stringForColumn:@"url"];
        model.imgurl = [set stringForColumn:@"imgurl"];
        model.title = [set stringForColumn:@"title"];
        model.briefinfo = [set stringForColumn:@"briefinfo"];
        model.id = [set stringForColumn:@"id"];
        
        [array addObject:model];
        
    }

    return array;
}

@end
