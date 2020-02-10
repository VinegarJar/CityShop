#import "YaBoOrgyTool.h"
#import <AVFoundation/AVFoundation.h>
#define kMusicType @"kMusicType"
#define YaSoundType @"YaSoundType"
@interface YaBoOrgyTool()
{
    BOOL _loadData;
}
@property (nonatomic, strong) AVAudioPlayer *bgPlayer;
@property (nonatomic, strong) NSMutableDictionary *soundIDs;
@end
@implementation YaBoOrgyTool
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
static YaBoOrgyTool *instance = nil;
+ (instancetype)sharedSoundToolManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YaBoOrgyTool alloc] init];
    });
    return instance;
}
- (instancetype)init {
    if (self = [super init]) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
        _loadData = YES;
        self.OutType = [[NSUserDefaults standardUserDefaults] integerForKey:kMusicType];
        self.soundType = [[NSUserDefaults standardUserDefaults] integerForKey:YaSoundType];
        [self loadSounds];
    }
    return self;
}
- (AVAudioPlayer *)bgPlayer {
    if (!_bgPlayer) {
        NSURL *bgMusicURL = [[NSBundle mainBundle] URLForResource:YaSoundBGMusic withExtension:nil];
        _bgPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bgMusicURL error:nil];
        [_bgPlayer prepareToPlay];
        _bgPlayer.numberOfLoops = -1;
        _bgPlayer.volume = [self volumeOfYaBoOrgyPlay:[[NSUserDefaults standardUserDefaults] integerForKey:kMusicType]];
        AudioSessionAddPropertyListener(kAudioSessionProperty_CurrentHardwareOutputVolume,
                                        audioVolumeChange, NULL);
    }
    return _bgPlayer;
}
- (void)setOutType:(YaBoOrgyPlay)OutType {
    _OutType = OutType;
    [[NSUserDefaults standardUserDefaults] setInteger:OutType forKey:kMusicType];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.bgPlayer.volume = [self volumeOfYaBoOrgyPlay:OutType];
    if (!_loadData) {
        if (OutType ==  YaBoOrgyLiberty) {
            [self.bgPlayer stop];
        } else {
            [self.bgPlayer play];
        }
    }
    _loadData = NO;
}
- (void)setSoundType:(YaBoOrgyPlay)soundType {
    _soundType = soundType;
    [[NSUserDefaults standardUserDefaults] setInteger:soundType forKey:YaSoundType];
    [[NSUserDefaults standardUserDefaults] synchronize];
    switch (soundType) {
        case YaBoOrgyManent:
            [self setSoundVolumn:1.0f];
            break;
        case YaBoOrgySummer:
            [self setSoundVolumn:0.65];
        case  YaBoOrgyMateHand:
            [self setSoundVolumn:0.35];
        default:
            [self setSoundVolumn:0];
            break;
    }
}
- (void)lookApproximateHand:(BOOL)playAgain {
    if ([self currentVolumn] == 0) {
        [self.bgPlayer pause];
        return;
    }
    if (self.OutType ==  YaBoOrgyLiberty) {
        [self.bgPlayer stop];
        return;
    }
    if ([self isOtherMusicPlaying]) {
        [self.bgPlayer stop];
        return;
    }
    if (playAgain) {
        [self.bgPlayer stop];
    }
    [self.bgPlayer play];
}
- (void)recentlyEasternFishing {
    [self.bgPlayer pause];
}
-  (void)stopBgMusic {
    [self.bgPlayer stop];
}
- (void)patWorthyLiberty:(NSString *)soundName {
    if (self.soundType ==  YaBoOrgyLiberty) return;
    if (![self currentVolumn]) return;
    [self loadSounds];
    SystemSoundID soundID = [self.soundIDs[soundName] unsignedIntValue];
    AudioServicesPlaySystemSound(soundID);
}
- (void)permanentlyHybridTextbook:(float)volume {
    [self.bgPlayer setVolume:volume];
}
#pragma mark -
#pragma mark 私有方法
- (float)volumeOfYaBoOrgyPlay:(YaBoOrgyPlay)type {
    float volume;
    switch (type) {
        case YaBoOrgyManent:
            volume = 1.0;
            break;
        case YaBoOrgySummer:
            volume= 0.65;
            break;
        case  YaBoOrgyMateHand:
            volume = 0.35;
            break;
        case  YaBoOrgyLiberty:
            volume = 0;
            break;
        default:
            break;
    }
    return volume;
}
#pragma mark 音量改变
void audioVolumeChange(void *inUserData, AudioSessionPropertyID inPropertyID,
                       UInt32 inPropertyValueSize, const void *inPropertyValue)
{
    Float32 value = *(Float32 *)inPropertyValue;
    if (value > 0) {
        [[YaBoOrgyTool sharedSoundToolManager] lookApproximateHand:YES];
    } else {
        [[YaBoOrgyTool sharedSoundToolManager] recentlyEasternFishing];
    }
}
- (void)loadSounds {
    if (self.soundIDs) return;
    self.soundIDs = [NSMutableDictionary dictionary];
    NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:YaSoundMusic withExtension:nil];
    NSBundle *soundBundle = [NSBundle bundleWithURL:bundleURL];
    NSArray *boundsURLs = [soundBundle URLsForResourcesWithExtension:@"mp4" subdirectory:nil];
    for (NSURL *soundURL in boundsURLs) {
        [self loadSoundWithURL:soundURL];
    }
}
- (void)loadSoundWithURL:(NSURL *)url {
    NSString *soundPath = [url.path lastPathComponent];
    if ([self.soundIDs objectForKey:soundPath]) return;
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    [self.soundIDs setObject:@(soundID) forKey:soundPath];
}
#pragma mark 是否有其他音乐正在播放
- (BOOL)isOtherMusicPlaying {
    UInt32 playing;
    UInt32 dataSize = sizeof(UInt32);
    AudioSessionGetProperty(kAudioSessionProperty_OtherAudioIsPlaying,
                            &dataSize,
                            &playing);
    return playing;
}
#pragma mark 获得当前的音量
- (float)currentVolumn {
    float volume;
    UInt32 dataSize = sizeof(float);
    AudioSessionGetProperty (kAudioSessionProperty_CurrentHardwareOutputVolume,
                             &dataSize,
                             &volume);
    return volume;
}
- (void)setSoundVolumn:(float) volumn {
    AudioSessionSetProperty(kAudioSessionProperty_CurrentHardwareOutputVolume,
                            sizeof(float),
                            &volumn);
}
#pragma clang diagnostic pop
@end


