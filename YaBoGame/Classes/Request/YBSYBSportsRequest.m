#import "YBSYBSportsRequest.h"
#import "EXTScope.h"
#define DEFAULT_REQUEST_TIME_OUT 20
typedef NS_ENUM(NSUInteger, HTTPMethod) {
    GET,
    POST
};
@interface YBSYBSportsRequest ()
@property (strong,nonatomic) AFHTTPSessionManager *manager;
@end
@implementation YBSYBSportsRequest
+ (instancetype)sharedManager{
    static dispatch_once_t onceToken;
    static YBSYBSportsRequest *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[super allocWithZone:NULL] init];
    });
    return manager;
}
+ (id)allocWithZone:(NSZone *)zone{
    return [self sharedManager];
}
-(AFHTTPSessionManager*)manager{
    if (!_manager) {
        NSString *url = [self getAppServerUrl];
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:url]];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
        _manager.requestSerializer.timeoutInterval = DEFAULT_REQUEST_TIME_OUT;
        _manager.securityPolicy.allowInvalidCertificates = YES;
    }
    return _manager;
}
- (BOOL)isNetSuccess:(id)JSON{
    id codeStr = [JSON objectForKey:@"status"];
    if (codeStr == nil) {
        return NO;
    }
    int code = [codeStr intValue];
    BOOL bSuccess = NO;
    if (code == 1) {
        bSuccess = YES;
    }else{
        return NO;
    }
    return bSuccess;
}
- (NSString *)getCommentErrorString:(NSError *)error{
    NSString *msg = @"网络异常,请检查网络";
    if (error.code == NSURLErrorTimedOut) {
        msg = @"请求超时,请检查网络";
    }
    else if (error.code == NSURLErrorCannotConnectToHost || error.code == NSURLErrorNotConnectedToInternet) {
        msg = @"网络未开启,请检查网络";
    }else if([error code] == NSURLErrorCancelled){
        msg = @"请检查网络,已经取消";
    }
    return msg;
}
- (void)postWithPath:(NSString *)path dict:(NSDictionary *)dict completed:(YBSportsCompletedBlock)completed{
    [self requestWithMetod:POST path:path params:dict completed:completed];
}
- (void)getWithPath:(NSString *)path dict:(NSDictionary *)dict completed:(YBSportsCompletedBlock)completed{
    [self requestWithMetod:GET path:path params:dict completed:completed];
}
- (void)requestWithMetod:(HTTPMethod)method path:(NSString *)path params:(NSDictionary *)params completed:(YBSportsCompletedBlock)completed{
    switch (method) {
        case GET: {
            @weakify(self)
            [[self manager]  GET:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                @strongify(self)
                if (completed) {
                    BOOL bSuccess = [self isNetSuccess:responseObject];
                    if (bSuccess==YES) {
                        completed(YES, responseObject);
                    }else{
                        completed(NO, responseObject[@"msg"]);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                @strongify(self)
                NSString *errStr = [self getCommentErrorString:error];
                if (completed) {
                    completed(NO, errStr);
                }
            }];
            break;
        }
        case POST: {
            @weakify(self)
             [[self manager] POST:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                 @strongify(self)
                 if (completed) {
                     BOOL bSuccess = [self isNetSuccess:responseObject];
                     if (bSuccess==YES) {
                         completed(YES, responseObject);
                     }else{
                         completed(NO, responseObject[@"msg"]);
                     }
                 }
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 @strongify(self)
                 NSString *errStr = [self getCommentErrorString:error];
                 if (completed) {
                     completed(NO, errStr);
                 }
             }];
            break;
        }
        default: {
            break;
        }
    }
}
- (NSString *)getAppServerUrl{
    return API_URL;
}
@end
