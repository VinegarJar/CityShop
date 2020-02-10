#import <Foundation/Foundation.h>
#import "SoundNamesHeader.h"
typedef NS_ENUM(NSInteger, SoundPlayType) {
    SoundPlayTypeHight = 0,
    SoundPlayTypeMiddle,
    SoundPlayTypeLow,
    SoundPlayTypeMute
};
@interface YaBoOrgyTool : NSObject
@property (nonatomic, assign) SoundPlayType bgMusicType;
@property (nonatomic, assign) SoundPlayType soundType;
- (void)recentlyEasternFishing;
- (void)dependOutsideSummer;
- (void)lookApproximateHand:(BOOL)playAgain;
- (void)patWorthyLiberty:(NSString *)soundName;
- (void)permanentlyHybridTextbook:(float)volume;
+ (instancetype)sharedSoundToolManager;
@end


