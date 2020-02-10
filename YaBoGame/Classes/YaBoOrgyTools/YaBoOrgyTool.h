#import <Foundation/Foundation.h>
#import "YaBoSoundr.h"
typedef NS_ENUM(NSInteger, YaBoOrgyPlay) {
    YaBoOrgyManent = 0,
    YaBoOrgySummer,
     YaBoOrgyMateHand,
     YaBoOrgyLiberty
};
@interface YaBoOrgyTool : NSObject
@property (nonatomic, assign) YaBoOrgyPlay OutType;
@property (nonatomic, assign) YaBoOrgyPlay soundType;
- (void)recentlyEasternFishing;
- (void)dependOutsideSummer;
- (void)lookApproximateHand:(BOOL)playAgain;
- (void)patWorthyLiberty:(NSString *)soundName;
- (void)permanentlyHybridTextbook:(float)volume;
+ (instancetype)sharedSoundToolManager;
@end


