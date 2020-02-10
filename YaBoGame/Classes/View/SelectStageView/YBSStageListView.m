#import "YBSStageListView.h"
#import "YBSStage.h"
#import "YBSStageView.h"
#import "YBSStageInfoManager.h"
@implementation YBSStageListView
- (instancetype)init {
    if (self = [super initWithFrame:ScreenBounds]) {
        self.contentSize = CGSizeMake(ScreenWidth * 4, ScreenHeight);
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.delegate = self;
        self.bounces  = NO;
        NSArray *bgNames = @[@"select_easy_bg", @"select_normal_bg", @"select_hard_bg", @"select_insane_bg"];
        for (int i = 0; i < 4; i++) {
            YBSFullBackgroundView *listView = [[YBSFullBackgroundView alloc] initWithFrame:CGRectMake(i * ScreenWidth, 0, ScreenWidth, ScreenHeight)];
            [listView setBackgroundImageWihtImageName:bgNames[i]];
            [self addSubview:listView];
        }
        [self loadStageInfo];
    }
    return self;
}
- (void)reloadStageForNumber:(int)num {
    YBSStageView *stageView = (YBSStageView *)[self viewWithTag:100 + num - 1];
    YBSStage *newStage = stageView.stage;
    stageView.stage.userInfo = [[YBSStageInfoManager sharedStageInfoManager] stageInfoWithNumber:num];
    stageView.stage = newStage;
}
- (void)loadStageInfo {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"stages.plist" ofType:nil];
    NSArray *stageArr = [NSArray arrayWithContentsOfFile:path];
    CGFloat stageViewW = 120;
    CGFloat stageViewH = 100;
    CGFloat viewMaxgin = ScreenWidth - stageViewW * 2 - 25 * 2;
    CGFloat topMagin = iPhone5 ? 130 : 80;
    YBSStageInfoManager *manager = [YBSStageInfoManager sharedStageInfoManager];
    for (int i = 0; i < stageArr.count; i++) {
        YBSStage *stage = [YBSStage stageWithDict:stageArr[i]];
        stage.num = i + 1;
        stage.userInfo = [manager stageInfoWithNumber:i + 1];
        CGFloat scrollX = ((int)(i / 6)) * ScreenWidth;
        CGFloat startX = 25 + ((i % 6) / 3) * (stageViewW + viewMaxgin) + scrollX;
        CGFloat startY = topMagin + (i % 3) * (stageViewH + 30);
        YBSStageView *stageView = [YBSStageView stageViewWithStage:stage frame:CGRectMake(startX, startY, stageViewW, stageViewH)];
        stageView.tag = 100 + i;
        [self insertSubview:stageView atIndex:5];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stageViewDidSelected:)];
        [stageView addGestureRecognizer:tap];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.didChangeScrollPage) {
        int page = (scrollView.contentOffset.x / ScreenWidth + 0.5);
        if (page < 0) page = 0;
        if (page > 3) page = 3;
        self.didChangeScrollPage(page);
    }
}
- (void)stageViewDidSelected:(UITapGestureRecognizer *)tap {
    if (self.didSelectedStageView) {
        [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundSelectedStage];
        self.didSelectedStageView(((YBSStageView *)tap.view).stage);
    }
}
@end
