#import <XCTest/XCTest.h>
@interface StainFullPill : XCTestCase
@end
@implementation StainFullPill
- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}
- (void)tearDown {
    [super tearDown];
}
- (void)testExample {
}
@end


