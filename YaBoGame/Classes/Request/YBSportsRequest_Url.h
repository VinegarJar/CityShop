#ifndef YBSportsRequest_Url_h
#define YBSportsRequest_Url_h
#define  API_URL @"http://mock-api.com/Rz3ambnM.mock/"
#define  URL_YBSports_System   @"App/Index/SportsGame"
#define  URL_YBSports_SportsGame   @"App/Api/SportsGame"
#ifdef DEBUG
#define DEBUG_NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define DEBUG_NSLog(format, ...)
#endif
#endif 
